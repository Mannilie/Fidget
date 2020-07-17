using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gem : MonoBehaviour
{
    public enum Color
    {
        Blue = 0,
        Green = 1, 
        Purple = 2, 
        Red = 3, 
        Yellow = 4
    }
    public Color color = Color.Blue;
    public float speed = 5f;
    public float endScale = .2f;
    public float minDistance = .1f;
    public bool isFinished;
    public bool isCollected;
    [HideInInspector] public Checkpoint checkpoint;
    
    [Header("References")]
    public Animator[] gemAnims;
    public Animator anim;
    public Collider2D col;

    [HideInInspector] public Transform slot;

    private ParticleSystem[] particles;
    private float startTime;
    private float journeyLength;

    private Vector3 startingPosition;
    private Vector3 startingScale;
    private Quaternion startingRotation;
    private Transform startingParent;
    
    private void Awake()
    {
        SelectAnim(color);
        col = GetComponent<Collider2D>();
    }
    private void Start()
    {
        startingPosition = transform.position;
        startingRotation = transform.rotation;
        startingScale = transform.localScale;
        startingParent = transform.parent;
    }
    private void Update()
    {
        if (isCollected && !isFinished)
        {
            float distCovered = (Time.time - startTime) * speed;
            float fracJourney = distCovered / journeyLength;

            Vector3 position = transform.position;
            Quaternion rotation = transform.rotation;
            Vector3 scale = transform.localScale;

            position = Vector2.MoveTowards(position, slot.position, fracJourney);
            position.z = startingPosition.z;
            scale = Vector2.Lerp(scale, Vector2.one * endScale, fracJourney);
            
            float distance = Vector2.Distance(position, slot.position);
            if (distance <= minDistance)
            {
                Stop();
                isFinished = true;
                transform.SetParent(slot, true);
                position = slot.position;
                scale = Vector3.one * endScale;
            }

            transform.localScale = scale;
            transform.position = position;
            transform.rotation = rotation;
        }
    }
    private void SelectAnim(Color color)
    {
        int index = (int)color;
        anim = gemAnims[index];
        anim.gameObject.SetActive(true);
        particles = anim.GetComponentsInChildren<ParticleSystem>();
        for (int i = 0; i < gemAnims.Length; i++)
        {
            if (index != i)
            {
                gemAnims[i].gameObject.SetActive(false);
            }
        }
    }
    public void Play()
    {
        anim.SetBool("IsStopped", false);
        foreach (var particle in particles)
        {
            particle.Play();
        }
    }
    public void Stop()
    {
        anim.SetBool("IsStopped" , true);
        foreach (var particle in particles)
        {
            particle.Stop();
        }
    }
    public void Show()
    {
        gameObject.SetActive(true);
    }
    public void Hide()
    {
        gameObject.SetActive(false);
    }
    public void Collect()
    {
        isCollected = true;
        startTime = Time.time;
        journeyLength = Vector2.Distance(transform.position, slot.position);
        col.enabled = false;
        Play();

        if(checkpoint.RemainingGems == 0)
        {
            // Disable checkpoint's collider
            checkpoint.collider.isTrigger = true;
        }
    }
    public void Reset()
    {
        isCollected = false;
        isFinished = false;
        journeyLength = 0f;
        col.enabled = true;

        transform.SetParent(startingParent, true);
        transform.position = startingPosition;
        transform.rotation = startingRotation;
        transform.localScale = startingScale;

        Show();
        Play();
    }
}
