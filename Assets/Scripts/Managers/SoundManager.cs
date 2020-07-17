using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SoundManager : MonoBehaviour
{
    private void Awake()
    {
        AudioSource[] sounds = GetComponentsInChildren<AudioSource>(true);
        soundDatabase = new Dictionary<string, AudioSource>();
        foreach (var sound in sounds)
        {
            // If there is no sound key already
            if (!soundDatabase.ContainsKey(sound.name))
            {
                // Add it to dictionary / hash map
                soundDatabase.Add(sound.name, sound);
            }
            else
            {
                Debug.LogError("Sound with the same name detected! Sound: " + sound.name);
            }
        }
    }
    private Dictionary<string, AudioSource> soundDatabase;
    private GameManager game; // Reference to Game
    private void Start()
    {
        game = GameManager.Instance;
    }
    private void SetVolume(AudioSource sound)
    {
        switch (sound.tag)
        {
            case "Effects":
                sound.volume = game.data.effectsVolume;
                break;
            case "Music":
                sound.volume = game.data.musicVolume;
                break;
            default:
                break;
        }
    }
    private bool SoundExists(string soundName)
    {
        if (soundDatabase.ContainsKey(soundName))
        {
            return true;
        }
        Debug.LogError("The Sound '" + soundName + "' doesn't exist in the Sound Database!");
        return false;
    }
    public void PlayOneShot(string soundName)
    {
        if (SoundExists(soundName))
        {
            AudioSource sound = soundDatabase[soundName];
            SetVolume(sound);
            sound.PlayOneShot(sound.clip);
        }
    }
    public void Play(string soundName)
    {
        if (SoundExists(soundName))
        {
            AudioSource sound = soundDatabase[soundName];
            SetVolume(sound);
            sound.Play();
        }
    }
    public void PlayLoop(string soundName)
    {
        if (SoundExists(soundName))
        {
            AudioSource sound = soundDatabase[soundName];
            SetVolume(sound);
            sound.loop = true;
            sound.Play();
        }
    }
    public void Stop(string soundName)
    {
        if (SoundExists(soundName))
        {
            AudioSource sound = soundDatabase[soundName];
            sound.loop = false;
            sound.Stop();
        }
    }
    public void StopAll()
    {
        foreach (var sound in soundDatabase)
        {
            sound.Value.Stop();
        }
    }
}
