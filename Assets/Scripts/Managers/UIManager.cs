using System.Collections;
using System.Collections.Generic;

using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using System;

public class UIManager : MonoBehaviour
{
    [Serializable] public class Controls
    {
        public DragPanel dragPanel;
        public Joystick joystick;
        public PredictionLine predictionLine;
    }
    [Serializable] public class Events
    {
        public UnityEvent onWin, onLose;
    }
    [Serializable] public class LoadingScreen
    {
        public Text percentLoadedText;
        public Slider progressSlider;
        public GameObject loadingScreenUI;
        public float progressSpeed = .2f;
        private float progress = 0f;
        public void Start()
        {
            Hide();
        }
        private void SetProgress(float progress)
        {
            progressSlider.value = progress;
            percentLoadedText.text = Mathf.CeilToInt(progress * 100).ToString() + "%";
        }
        private void Show()
        {
            loadingScreenUI.SetActive(true);    
        }
        private void Hide()
        {
            loadingScreenUI.SetActive(false);
        }
        public IEnumerator UpdateProgress(AsyncOperation operation)
        {
            SetProgress(0f);
            Show();
            while (!operation.isDone)
            {
                float targetProgress = operation.progress;
                targetProgress = Mathf.Clamp01(targetProgress / .9f);
                progress = Mathf.Lerp(progress, targetProgress, progressSpeed);
                SetProgress(progress);
                yield return null;
            }
            Hide();
        }
    }

    public Controls controls;
    public Events events;
    public LoadingScreen loadingScreen = new LoadingScreen();
    public GameObject pullBack, pullForward;
    public Slider musicSlider, effectsSlider;
    public Text timerText;
    public Text gameOverTimeText;
    [Header("Buttons")]
    public Color tintColor;
    public Button continueButton;
    [Header("Winning Screen")]
    public Sprite bronzeSprite;
    public float bronzeTime = 10f;
    public Sprite silverSprite;
    public float silverTime = 10f;
    public Sprite goldSprite;
    public Image medalImage;
    public Color bronzeColor;
    public Color silverColor;
    public Color goldColor;
    private GameManager game;
    private void Start()
    {
        game = GameManager.Instance;
        
        // Register Event for Updating Game Sound
        musicSlider.onValueChanged.AddListener(OnMusicVolumeChanged);
        effectsSlider.onValueChanged.AddListener(OnEffectsVolumeChanged);
        musicSlider.value = game.data.musicVolume;
        effectsSlider.value = game.data.effectsVolume;

        pullBack.SetActive(game.data.isJumpPullBack);
        pullForward.SetActive(!game.data.isJumpPullBack);

        if (game.data.currentCheckpoint.index < 0)
        {
            continueButton.GetComponent<Image>().color = tintColor;
            continueButton.enabled = false;
        }
        else
        {
            continueButton.GetComponent<Image>().color = Color.white;
            continueButton.enabled = true;
        }

        // Show Loading Screen (WRONG?)
        loadingScreen.Start();
    }
    private void Update()
    {
        timerText.text = Utility.TimeToString(game.timer.elapsedTime);
    }
    private void OnMusicVolumeChanged(float value)
    {
        game.data.musicVolume = value;
        game.Save();
    }
    private void OnEffectsVolumeChanged(float value)
    {
        game.data.effectsVolume = value;
        game.Save();
    }
    public void TogglePullBack()
    {
        game.data.isJumpPullBack = !game.data.isJumpPullBack;
        game.Save();

        pullBack.SetActive(game.data.isJumpPullBack);
        pullForward.SetActive(!game.data.isJumpPullBack);
    }
    public void ShowLoadingScreen(AsyncOperation operation)
    {
        StartCoroutine(loadingScreen.UpdateProgress(operation));
    }
    public void GameOver()
    {
        gameOverTimeText.text = "Your Time: ";

        if (game.timer.elapsedTime >= (bronzeTime * 60))
        {
            medalImage.sprite = bronzeSprite;
            gameOverTimeText.text += "<color=#" + ColorUtility.ToHtmlStringRGB(bronzeColor) + ">";
        }
        else if (game.timer.elapsedTime >= (silverTime * 60))
        {
            medalImage.sprite = silverSprite;
            gameOverTimeText.text += "<color=#" + ColorUtility.ToHtmlStringRGB(silverColor) + ">";
        }
        else
        {
            medalImage.sprite = goldSprite;
            gameOverTimeText.text += "<color=#" + ColorUtility.ToHtmlStringRGB(goldColor) + ">";
        }

        gameOverTimeText.text += Utility.TimeToString(game.timer.elapsedTime) + "</color>";
    }
}
