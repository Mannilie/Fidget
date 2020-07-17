using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OnFinishedEvent : MonoBehaviour
{
    public enum Action
    {
        Disable,
        Destroy
    }
    public Action action = Action.Disable;
    public ParticleSystem[] particles;
    public AudioSource[] sounds;
    private void Start()
    {
        // Get Child Particles & Audio Sources
        particles = GetComponentsInChildren<ParticleSystem>();
        sounds = GetComponentsInChildren<AudioSource>();
    }
    private void Update()
    {
        // If everything has finished
        if(IsFinished())
        {
            switch (action)
            {
                case Action.Disable:
                    // Disable the GameObject
                    gameObject.SetActive(false);
                    break;
                case Action.Destroy:
                    Destroy(gameObject);
                    break;
                default:
                    break;
            }
        }
    }
    private bool IsFinished()
    {
        // Loop through all particles
        foreach (var particle in particles)
        {
            // Is particle playing?
            if (particle.isPlaying)
            {
                // Hasn't finished
                return false;
            }
        }
        // Loop through all audio sources
        foreach (var sound in sounds)
        {
            // Is audio playing?
            if (sound.isPlaying)
            {
                // Hasn't finished
                return false;
            }
        }
        // Everything has finished!
        return true;
    }
}
