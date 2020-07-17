using UnityEngine;
using System.Collections;

public class Enemy : MonoBehaviour
{
    public enum State
    {
        MoveLeft,
        MoveRight,
        Paused
    }

    public State currentState;
    public float scaledMovementSpeed = 1f;
    public float movementSpeed = 10f;
    public float rotationSpeed = 10f;
    public SurfaceController surface;
    public Transform model;
    public Renderer shell;
    public Renderer body;
    public Animator shellAnimator;
    private State prevState;
    private bool isActivated = false;

    private GameManager game;

    private void Start()
    {
        surface.onSurfaceHit.AddListener(OnSurfaceHit);
        game = GameManager.Instance;
    }
    private void Update()
    {
        if (game.isGamePaused)
            return;

        isActivated = shell.isVisible || body.isVisible;
        if (isActivated)
        {
            surface.enabled = true;
            Vector3 euler = model.localEulerAngles;
            Vector3 moveDir = Vector3.zero;
            switch (currentState)
            {
                case State.MoveLeft:
                    moveDir = -transform.right;
                    euler.y = Mathf.Lerp(euler.y, 0, rotationSpeed * Time.deltaTime);
                    break;
                case State.MoveRight:
                    moveDir = transform.right;
                    euler.y = Mathf.Lerp(euler.y, 180, rotationSpeed * Time.deltaTime);
                    break;
            }
            model.localEulerAngles = euler;
            transform.position += moveDir * movementSpeed * scaledMovementSpeed * Time.deltaTime;
        }
        else
        {
            surface.enabled = false;
        }
    }
    private void OnTriggerEnter2D(Collider2D col)
    {
        switch (col.tag)
        {
            case "Death":
            case "Lock":
                ToggleMovement();
                break;
        }
    }
    void OnSurfaceHit(SurfaceType surfaceType)
    {
        surface.Stick();
    }
    private void ToggleMovement()
    {
        if (currentState == State.MoveLeft) currentState = State.MoveRight;
        else if (currentState == State.MoveRight) currentState = State.MoveLeft;
    }
    public void AttackPlayer()
    {
        shellAnimator.SetTrigger("AttackPlayer");
    }
}