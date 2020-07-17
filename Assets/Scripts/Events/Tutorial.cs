using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tutorial : MonoBehaviour
{
    public Animator anim;
    public Transform focusCircle;

    private GameManager game;

    private void Awake()
    {
        anim = GetComponent<Animator>();
        focusCircle = transform.Find("FocusCircle");
    }

    private void Start()
    {
        game = GameManager.Instance;
        game.events.onStart.AddListener(OnGameStart);
        game.player.events.onMove.AddListener(OnPlayerMoved);
        game.player.events.onJump.AddListener(OnPlayerJumped);
    }

    private void Update()
    {
#if UNITY_ANDROID || UNITY_IOS
        Focus(game.uiManager.controls.joystick.transform.position);
#elif UNITY_STANDALONE || UNITY_WEBGL
        Focus(game.player.transform.position);
#endif
    }

    private void Focus(Vector3 position)
    {
        Vector3 focusPos = focusCircle.position;
        focusPos.x = position.x;
        focusPos.y = position.y;
        focusCircle.position = focusPos;
    }

    private void OnGameStart()
    {
        //Focus(game.player.transform.position);
        if (game.data.playTutorial)
        {
            anim.SetTrigger("Focus");
        }

        game.data.playTutorial = false;
        game.Save();
    }

    private void OnPlayerMoved()
    {
        if (game.player.isWalking)
        {
            // Well done!
        }
    }

    private void OnPlayerJumped()
    {
        // Well Done!
    }
}
