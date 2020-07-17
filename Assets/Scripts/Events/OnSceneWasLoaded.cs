using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.Events;
using UnityEngine.SceneManagement;

public class OnSceneWasLoaded : MonoBehaviour
{
    public UnityEvent onSceneWasLoaded;
    private void Awake()
    {
        SceneManager.sceneLoaded += OnLoad;
    }
    private void OnLoad(Scene loadedScene, LoadSceneMode loadSceneMode)
    {
        onSceneWasLoaded.Invoke();
    }
}
