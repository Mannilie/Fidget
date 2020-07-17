using System;
using UnityEngine;
using System.Xml.Serialization;
using UnityEngine.SceneManagement;
using UnityEngine.Events;
using NaughtyAttributes;

public class GameManager : MonoBehaviour
{
    #region Singleton

    public static GameManager Instance = null;

    private void Awake()
    {
        Instance = this;
        uiManager = GetComponentInChildren<UIManager>();
        soundManager = GetComponentInChildren<SoundManager>();
        timer = GetComponentInChildren<Timer>();
        player = FindObjectOfType<Player>();
        Load();
    }

    private void OnDestroy()
    {
        Instance = null;
    }

    #endregion

    [Serializable]
    [XmlRoot(Namespace = "Game")]
    public class Data
    {
        public string fileName = "GameData";
        [XmlAttribute] public bool playTutorial = true;
        [XmlAttribute] public bool isJumpPullBack;
        [XmlAttribute] public float musicVolume = 1f;
        [XmlAttribute] public float effectsVolume = 1f;
        [XmlElement] public Checkpoint.Data currentCheckpoint = new Checkpoint.Data();
        [XmlElement] public Checkpoint.Data bestCheckpoint = new Checkpoint.Data();
    }

    [Serializable]
    public class Events
    {
        public UnityEvent onStart, onPause, onResume;
    }

    public Data data;
    public Events events;

    [HideInInspector] public UIManager uiManager;
    [HideInInspector] public SoundManager soundManager;
    [HideInInspector] public Timer timer;
    [HideInInspector] public bool isGamePaused = false;
    [HideInInspector] public UnityEvent onGamePaused, onGameUnPaused;
    [HideInInspector] public Player player;

    private void Start()
    {
        Application.targetFrameRate = 60;
        Load();
    }
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            PauseGame();
        }
    }

    #region Game Saves

    [Button]
    public void Save()
    {
        // Saves Game Data to XML file
        Utility.SaveData(data, Utility.GetFilePath(data.fileName));
    }

    [Button]
    public void Load()
    {
        // Loads GameData XML to variable
        data = Utility.LoadData<Data>(Utility.GetFilePath(data.fileName));
        if (data == null)
            data = new Data();
    }

    [Button]
    public void Delete()
    {
        data = new Data();
        Save();
    }

    public void SaveCheckpoint(Checkpoint checkpoint)
    {
        // Create a new current and get best
        Checkpoint.Data currentCheckpoint = new Checkpoint.Data();
        Checkpoint.Data bestCheckpoint = data.bestCheckpoint;

        // Save Checkpoint Data
        currentCheckpoint.index = checkpoint.index;
        currentCheckpoint.elapsedTime = timer.elapsedTime;
        currentCheckpoint.spawnPosition = checkpoint.spawnPoint.position;

        // Compare best with current
        if (bestCheckpoint.index < currentCheckpoint.index)
            bestCheckpoint = currentCheckpoint; // Replace best

        // Apply Changes
        data.currentCheckpoint = currentCheckpoint;
        data.bestCheckpoint = bestCheckpoint;

        // Save the Game!
        Save();
    }

    #endregion

    #region Game Functions

    public void StartGame()
    {
        // Initialize some values
        timer.elapsedTime = 0f;
        timer.enabled = true;

        // Invoke events
        events.onStart.Invoke();

        // Checkpoints
        Checkpoint[] checkpoints = FindObjectsOfType<Checkpoint>();
        // Sort Array by name of Checkpoints
        Array.Sort(checkpoints, delegate(Checkpoint x, Checkpoint y) { return x.name.CompareTo(y.name); });
        // Assign Index to each Checkpoint
        for (int i = 0; i < checkpoints.Length; i++)
        {
            checkpoints[i].index = i;
        }

        // Load Game State
        Checkpoint.Data currentCheckpoint = data.currentCheckpoint;
        if (currentCheckpoint.index >= 0)
        {
            // Update Game Time
            timer.elapsedTime = currentCheckpoint.elapsedTime;
            // Unlock prior checkpoints
            for (int i = 0; i < checkpoints.Length; i++)
            {
                if (i <= currentCheckpoint.index)
                {
                    checkpoints[i].HideGems();
                    checkpoints[i].Unlock();
                }
            }

            Player player = FindObjectOfType<Player>();
            player.transform.position = data.currentCheckpoint.spawnPosition;
        }
    }

    public void PauseGame()
    {
        timer.enabled = false;
        isGamePaused = true;
        onGamePaused.Invoke();
    }

    public void PlayGame()
    {
        timer.enabled = true;
        isGamePaused = false;
        onGameUnPaused.Invoke();
    }

    public void ExitGame()
    {
        Application.Quit();
    }

    public void GameOver(bool isWin)
    {
        timer.enabled = false;
        uiManager.GameOver();
        if (isWin)
        {
            uiManager.events.onWin.Invoke();
        }
    }

    public void ToggleControls()
    {
        data.isJumpPullBack = !data.isJumpPullBack;
        Save();
    }

    #endregion

    #region Scene Management

    public void LoadScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }

    public void LoadSceneAsync(string sceneName)
    {
        AsyncOperation async = SceneManager.LoadSceneAsync(sceneName);
        uiManager.ShowLoadingScreen(async);
    }

    public void LoadSceneAndDestroyAll(string sceneName)
    {
        foreach (GameObject o in FindObjectsOfType<GameObject>())
        {
            Destroy(o);
        }

        LoadScene(sceneName);
    }

    #endregion
}