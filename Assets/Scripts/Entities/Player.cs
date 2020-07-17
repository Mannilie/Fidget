using System;
using System.Collections;
using System.Collections.Generic;

using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

[RequireComponent(typeof(SurfaceController))]
public class Player : MonoBehaviour
{
    [Serializable]
    public class Events
    {
        public class TriggerEvent : UnityEvent<Collider2D> { }
        public TriggerEvent onTriggerEnter,
                            onTriggerStay,
                            onTriggerExit;
        public UnityEvent onUpdate,
                          onJump,
                          onMove,
                          onDoubleJump,
                          onDeath,
                          onRestart,
                          onAiming;
        public Events()
        {
            onTriggerEnter = new TriggerEvent();
            onTriggerStay = new TriggerEvent();
            onTriggerExit = new TriggerEvent();
            onUpdate = new UnityEvent();
            onJump = new UnityEvent();
            onMove = new UnityEvent();
            onDoubleJump = new UnityEvent();
            onDeath = new UnityEvent();
            onRestart = new UnityEvent();
            onAiming = new UnityEvent();
        }
    }
    [Serializable]
    public class SoundEffects
    {
        private Player player;
        private GameManager game;
        public void Initialize(Player owner)
        {
            game = GameManager.Instance;
            player = owner;
            player.events.onJump.AddListener(OnJump);
            player.events.onDoubleJump.AddListener(OnDoubleJump);
            player.events.onTriggerEnter.AddListener(OnTriggerEnter);

            player.surface.onSurfaceHit.AddListener(OnSurfaceHit);
        }
        private void OnJump()
        {
            game.soundManager.PlayOneShot("Jump");
        }
        private void OnDoubleJump()
        {
            game.soundManager.PlayOneShot("DoubleJump");
        }
        private void OnSurfaceHit(SurfaceType surfaceType)
        {
            switch (surfaceType)
            {
                case SurfaceType.NULL:
                    break;
                case SurfaceType.NORMAL:
                    game.soundManager.Stop("IceSkate");
                    break;
                case SurfaceType.BOUNCE:
                    game.soundManager.PlayOneShot("Bounce_Hit_01");
                    break;
                case SurfaceType.SLIDE:
                    game.soundManager.Play("IceSkate");
                    break;
                case SurfaceType.DEATH:
                    game.soundManager.PlayOneShot("Death_01");
                    break;
                case SurfaceType.ROCKS:
                    game.soundManager.PlayOneShot("RockCrumble");
                    break;
                default:
                    break;
            }
        }
        private void OnTriggerEnter(Collider2D other)
        {
            switch (other.tag)
            {
                case "Death":
                    float value = UnityEngine.Random.Range(-1f, 1f);
                    if (value < 0)
                        game.soundManager.PlayOneShot("Death_01");
                    else
                        game.soundManager.PlayOneShot("Death_02");
                    break;
                case "Goal":
                    break;
                case "Gem":
                    game.soundManager.PlayOneShot("GemCollected");
                    break;
                default:
                    break;
            }
        }
    }
    [Serializable]
    public class Particles
    {
        public ParticleSystem cloud;
        public ParticleSystem rocksExplosion;
        public ParticleSystem leavesTrail;
        public ParticleSystem leavesExplosion;
        public ParticleSystem snowTrail;
        public ParticleSystem snowExplosion;

        private Player player;
        private Collider2D currentTrigger;
        public void Initialize(Player owner)
        {
            player = owner;
            player.events.onTriggerEnter.AddListener(OnTriggerEnter);
            player.events.onUpdate.AddListener(Update);
          //  player.events.onTriggerStay.AddListener(OnTriggerStay);
            player.events.onTriggerExit.AddListener(OnTriggerExit);
        }
        private void OnTriggerEnter(Collider2D other)
        {
            currentTrigger = other;
            switch (other.tag)
            {
                case "Leaves":
                    leavesExplosion.Play(true);
                    leavesTrail.Play(true);
                    break;
                case "Snow":
                    snowExplosion.Play(true);
                    snowTrail.Play(true);
                    break;
                case "Rocks":
                    rocksExplosion.Play(true);
                    rocksExplosion.transform.rotation = Quaternion.LookRotation(player.surface.normal);
                    break;
            }
        }
        private void Update()
        {
            if(currentTrigger && player.isWalking)
            {
                switch (currentTrigger.tag)
                {
                    case "Leaves": if(leavesTrail.isStopped) leavesTrail.Play(true); break;
                    case "Snow": if (snowTrail.isStopped) snowTrail.Play(true); break;
                }
            }
            else
            {
                leavesTrail.Stop(true, ParticleSystemStopBehavior.StopEmitting);
                snowTrail.Stop(true, ParticleSystemStopBehavior.StopEmitting);
            }
        }
        private void OnTriggerExit(Collider2D other)
        {
            if (currentTrigger == other)
            {
                leavesTrail.Stop(true, ParticleSystemStopBehavior.StopEmitting);
                leavesTrail.Stop(true, ParticleSystemStopBehavior.StopEmitting);
                currentTrigger = null;
            }
        }
    }
    [Serializable]
    public class Animations
    {
        public Transform model;
        public Animator anim;
        public float rotSpeed = 10f;
        public float walkSpeed = 1.5f;
        private Player player;
        public void Initialize(Player owner)
        {
            player = owner;
            player.events.onDeath.AddListener(OnDeath);
            player.events.onRestart.AddListener(OnRestart);
            player.events.onJump.AddListener(OnJump);
            player.events.onUpdate.AddListener(OnUpdate);

            player.surface.onSurfaceHit.AddListener(OnSurfaceHit);
        }
        private void OnDeath()
        {
            anim.SetTrigger("Dead");
        }
        private void OnRestart()
        {
            anim.SetTrigger("Restart");
        }
        private void OnUpdate()
        {
            Rotate();

            // TESTING
            anim.SetFloat("SurfaceDirectionX", player.surface.normal.x);
            anim.SetFloat("SurfaceDirectionY", player.surface.normal.y);
            float aimBlend = 1.0f - (1.0f - player.jumpMagnitude / player.maxJumpVelocity);
            anim.SetBool("IsAiming", player.isAiming);
            anim.SetFloat("AimBlend", aimBlend);
            anim.SetBool("IsStuck", player.surface.isStuck);

            float walkBlend = Mathf.Abs(player.moveDirection * walkSpeed);
            anim.SetBool("IsWalking", player.isWalking);
            anim.SetFloat("WalkBlend", walkBlend);
            anim.SetBool("IsDoubleJumping", player.isDoubleJumping);
        }
        private void OnJump()
        {
            anim.SetTrigger("Jump");
        }
        private void OnSurfaceHit(SurfaceType surfaceType)
        {
            anim.SetFloat("SurfaceType", (float)surfaceType);
            anim.SetBool("IsOnSurface", true);
        }
        public void Rotate()
        {
            Vector3 vel = player.rigid.velocity;
            switch (player.surface.surfaceType)
            {
                case SurfaceType.NULL:
                    {
                        Vector3 cross = Vector3.Cross(Vector3.forward, vel);
                        Quaternion rotation = Quaternion.LookRotation(Vector3.forward, cross);
                        if (vel.normalized.x < 0)
                            rotation *= Quaternion.AngleAxis(180, Vector3.left);
                        model.rotation = rotation;
                    }
                    break;
                case SurfaceType.ROCKS:
                case SurfaceType.NORMAL:
                    if (player.isAiming)
                    {
                        float worldAngle = player.transform.eulerAngles.z;
                        Vector3 localDir = Quaternion.AngleAxis(worldAngle, -Vector3.forward) * player.jumpDirection;
                        if (localDir.x > 0)
                            model.localRotation = Quaternion.AngleAxis(0, Vector3.up);
                        else
                            model.localRotation = Quaternion.AngleAxis(180, Vector3.up);
                    }
                    else
                    {
                        // Rotate model in direction of player movement
                        Vector3 euler = model.transform.localEulerAngles;
                        float y = player.moveDirection > 0 ? 0f : 180f;
                        euler.x = 0;
                        euler.y = Mathf.Lerp(euler.y, y, rotSpeed * Time.deltaTime);
                        euler.z = 0;
                        model.transform.localEulerAngles = euler;
                    }
                    break;
                case SurfaceType.BOUNCE:
                    break;
                case SurfaceType.SLIDE:
                    {
                        Vector3 cross = Vector3.Cross(Vector3.right, player.surface.normal);
                        Quaternion rotation = Quaternion.LookRotation(cross);
                        float angle = vel.x > 0 ? 0f : 180f;
                        rotation *= Quaternion.AngleAxis(angle, Vector3.up);
                        model.rotation = rotation;
                    }
                    break;
                default:
                    break;
            }

            if (player.isDead)
            {
                model.rotation = Quaternion.identity;
            }
        }
    }

    public int maxJumpAmount = 2;
    public float walkSpeed = 10f;
    public float bounceForce = 5f;
    public bool isDead, isWalking, isAiming, isDoubleJumping;
    public float maxJumpVelocity = 15f;
    public float moveDirection;
    public Vector3 jumpDirection;
    public float gameOverDelay = 1f;
    public PredictionLine predictionLine;
    public Rigidbody2D rigid;

    public Events events;
    public Animations animations;
    public SoundEffects soundEffects;
    public Particles particles;

    [HideInInspector] public SurfaceController surface;
    [HideInInspector] public float jumpMagnitude = 0f;

    private int jumpCount = 0;
    private Gem currentGem;
    private Vector3 originalVelocity;
    private GameManager game;

    // Input Controls
    [HideInInspector] public Joystick joystick;
    [HideInInspector] public DragPanel dragPanel;

    private void Awake()
    {
        rigid = GetComponent<Rigidbody2D>();
        surface = GetComponent<SurfaceController>();
        events = new Events();
        originalVelocity = Vector3.down;
    }
    private void Start()
    {
        game = GameManager.Instance;
        game.events.onPause.AddListener(Pause);
        game.events.onResume.AddListener(Resume);
        game.events.onStart.AddListener(Resume);
        surface.onSurfaceHit.AddListener(OnSurfaceHit);
        // Register Inputs
        UIManager.Controls controls = game.uiManager.controls;
        predictionLine = controls.predictionLine;
        dragPanel = controls.dragPanel;
        joystick = controls.joystick;
        // Initialize subsystems [LAST]
        animations.Initialize(this);
        soundEffects.Initialize(this);
        particles.Initialize(this);
        // Pause the player
        Pause();
    }
    private void OnDestroy()
    {
        if (predictionLine)
        {
            predictionLine.gameObject.SetActive(true);
        }
        surface.onSurfaceHit.RemoveListener(OnSurfaceHit);
    }
    private void Update()
    {
        events.onUpdate.Invoke();

        // If the player is dead
        if (isDead || game.isGamePaused)
            return; // Exit the function 

        #region Jumping
        if (dragPanel.isDragging)
        {
            // Get JumpDirection
            jumpDirection = dragPanel.Direction * (game.data.isJumpPullBack ? -1f : 1f);
            AimJump(jumpDirection, dragPanel.Distance);
        }
        if (dragPanel.isPointerUp)
        {
            Jump(jumpDirection);
        }
        #endregion

        if (isAiming)
        {
            events.onAiming.Invoke();
            return; // Exit Update
        }

        #region Movement
        // Declare input direction values
        Vector2 input = Vector2.zero;
#if UNITY_STANDALONE || UNITY_WEBGL
        input.x = Input.GetAxis("Horizontal");
        input.y = Input.GetAxis("Vertical");
#elif UNITY_ANDROID || UNITY_IOS
        if (joystick)
        {
            input.x = joystick.Horizontal;
            input.y = joystick.Vertical;
        }
#endif
        // Perform Movement Logic
        Move(input.x, input.y);
        #endregion
    }
    private void OnTriggerEnter2D(Collider2D other)
    {
        if (isDead)
            return;

        events.onTriggerEnter.Invoke(other);

        switch (other.tag)
        {
            case "Goal":
                GameManager.Instance.GameOver(true);
                break;
            case "Gem":
                currentGem = other.GetComponent<Gem>();
                if (currentGem)
                    currentGem.Collect();
                break;
            case "Death":
                StartCoroutine(Die());
                break;
            case "Checkpoint":
                Checkpoint checkpoint = other.GetComponent<Checkpoint>();
                if (checkpoint)
                    game.SaveCheckpoint(checkpoint);
                break;
            default:
                break;
        }
    }
    private void OnTriggerStay2D(Collider2D other)
    {
        if (isDead)
            return;

        events.onTriggerStay.Invoke(other);
    }
    private void OnTriggerExit2D(Collider2D other)
    {
        if (isDead)
            return;

        events.onTriggerExit.Invoke(other);
    }
    private void OnCollisionEnter2D(Collision2D col)
    {
        if (isDead)
            return;

        if (col.collider.tag == "Monster")
        {
            StartCoroutine(Die());
        }
    }

    private void OnSurfaceHit(SurfaceType surfaceType)
    {
        if (isDead)
            return;

        // Surfaces to stick to & unstick from
        switch (surfaceType)
        {
            case SurfaceType.NORMAL:
                surface.Stick();
                break;
            case SurfaceType.BOUNCE:
            case SurfaceType.ROCKS:
                surface.UnStick();
                break;
        }

        // Surfaces to reset jump
        switch (surfaceType)
        {
            case SurfaceType.NORMAL:
            case SurfaceType.SLIDE:
            case SurfaceType.BOUNCE:
                isDoubleJumping = false;
                isAiming = false;
                jumpCount = 0;
                break;
        }
    }
    private IEnumerator Die()
    {
        rigid.velocity = Vector3.zero;

        Pause();
        events.onDeath.Invoke();

        yield return new WaitForSeconds(gameOverDelay);

        Restart();
        events.onRestart.Invoke();

        // If collected a gem AND it's checkpoint is still locked
        if (currentGem)
        {
            // Use that gem to reset all other ones it's tied to
            currentGem.checkpoint.Lock();
            currentGem.checkpoint.ResetGems();
        }
    }

    public void Move(float horizontal, float vertical)
    {
        // If the Player is Airborne
        switch (surface.surfaceType)
        {
            case SurfaceType.NULL:
            case SurfaceType.SLIDE:
            case SurfaceType.ROCKS:
                return; // Exit the function
        }
        // Detect Input
        isWalking = horizontal != 0f || vertical != 0f;
        if (isWalking)
        {
            // Convert input to 2D directional vector
            Vector2 inputDir = new Vector2(horizontal, vertical);
            // Use Dot Product of input to determine direction to move
            moveDirection = Vector2.Dot(inputDir, transform.right);
            // Apply movement
            transform.position += transform.right * moveDirection * walkSpeed * Time.deltaTime;
        }
        events.onMove.Invoke();
    }
    public void AimJump(Vector3 direction, float magnitude)
    {
        // If hasn't reached max jump
        if (jumpCount < maxJumpAmount)
        {
            // Show Line Trajectory
            predictionLine.gameObject.SetActive(true);
            predictionLine.SetTrajectory(transform.position, direction.normalized * jumpMagnitude, Physics.gravity);
            // Calculate Jump Magnitude
            isAiming = true;
            jumpMagnitude = Mathf.Clamp(magnitude, 0, maxJumpVelocity);
        }
    }
    public void Jump(Vector3 direction)
    {
        // If hasn't reached max jump
        if (jumpCount < maxJumpAmount)
        {
            // Disable Line
            predictionLine.gameObject.SetActive(false);
            // If hasn't double jumped
            if (!isDoubleJumping)
            {
                if (jumpCount == 1 && surface.surfaceType == SurfaceType.NULL)
                {
                    isDoubleJumping = true;
                    events.onDoubleJump.Invoke();
                }
                else
                {
                    events.onJump.Invoke();
                }
                isAiming = false; // Note (Manny): Consider changing variable name to 'isAiming'
                // Perform Jump Logic
                surface.UnStick();
                rigid.velocity = Vector2.zero;
                rigid.AddForce(direction.normalized * jumpMagnitude, ForceMode2D.Impulse);
                jumpCount++; // Increase JumpCount
            }
        }
    }
    public void Pause()
    {
        surface.enabled = false;
        isDead = true;
        if (!surface.isStuck)
        {
            originalVelocity = rigid.velocity;
            rigid.constraints = RigidbodyConstraints2D.FreezeAll;
        }
    }
    public void Resume()
    {
        surface.enabled = true;
        isDead = false;
        if (!surface.isStuck)
        {
            rigid.constraints = RigidbodyConstraints2D.None;
            rigid.velocity = originalVelocity;
        }
    }
    public void Restart()
    {
        Jump(Vector3.down);
        transform.position = game.data.currentCheckpoint.spawnPosition;
        Resume();
    }
}
