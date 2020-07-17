using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;

using NaughtyAttributes;

using System.Xml.Serialization;

public class Checkpoint : MonoBehaviour
{
    [Serializable]
    [XmlRoot(Namespace = "Checkpoint")]
    public class Data
    {
        [XmlAttribute] public int index = -1;
        [XmlAttribute] public float elapsedTime = float.MaxValue;
        [XmlElement] public Vector3 spawnPosition = Vector3.zero;
    }

    public new Collider2D collider;
    public Transform gemParent;
    public Transform slotsParent;
    public Transform spawnPoint;
    public Animator anim;
    private Slots gemSlots;
    private Gem[] gems;
    [HideInInspector] public int index = 0;
    private GameManager game;
    public int RemainingGems
    {
        get
        {
            int count = gems.Length;
            foreach (var gem in gems)
            {
                if (gem.isCollected)
                    count--;
            }
            return count;
        }
    }
    public bool IsUnlocked
    {
        get
        {
            // If Script is Disabled then it is unlocked
            return !enabled;
        }
    }
    private void Start()
    {
        game = GameManager.Instance;
    }
    private void Reset()
    {
        collider = GetComponent<Collider2D>();
        gemParent = Utility.FindChildRecursive(transform, "Gems");
        slotsParent = Utility.FindChildRecursive(transform, "Slots");
        anim = Utility.FindChildRecursive(transform, "Door").GetComponent<Animator>();
        spawnPoint = Utility.FindChildRecursive(transform, "SpawnPoint");
    }
    private void Awake()
    {
        collider = GetComponent<Collider2D>();
        gems = gemParent.GetComponentsInChildren<Gem>();
        gemSlots = slotsParent.GetComponentInChildren<Slots>();
        anim = gemSlots.GetComponentInChildren<Animator>();
        // Set length required for gem slots
        gemSlots.SetLength(gems.Length);
        foreach (var gem in gems)
        {
            gem.checkpoint = this;
        }
        // Assign Gems to Available Slots
        for (int i = 0; i < gemSlots.Length; i++)
        {
            Gem current = gems[i];
            current.slot = gemSlots.GetSlot(i);
        }
    }
    private void Update()
    {
        // If all gems are finished moving
        if (AllGemsCollected())
        {
            // Unlock Checkpoint
            Unlock();
        }
    }
    private bool AllGemsCollected()
    {
        foreach (Gem gem in gems)
        {
            if (!gem.isFinished)
            {
                return false;
            }
        }
        return true;
    }
    public void HideGems()
    {
        foreach (var gem in gems)
        {
            gem.Hide();
        }
    }
    public void ResetGems()
    {
        foreach (var gem in gems)
        {
            gem.Reset();
        }
    }
    public void Unlock()
    {
        anim.SetBool("IsLocked", false);
        collider.isTrigger = true;
        enabled = false;

        // Play Door sound
        game.soundManager.Play("DoorOpen");
    }
    public void Lock()
    {
        anim.SetBool("IsLocked", true);
        collider.isTrigger = false;
        enabled = true;
    }
    public int[] GetCollectedGems()
    {
        List<int> collectedGems = new List<int>();
        for (int i = 0; i < gems.Length; i++)
        {
            if(gems[i].isCollected)
            {
                collectedGems.Add(i);
            }
        }
        return collectedGems.ToArray();
    }
    public void CollectGem(int index)
    {
        if (index < 0 || index >= gems.Length)
            return;

        gems[index].Collect();
    }
    [Button] public void CollectAllGems()
    {
        // Loop through each gem
        foreach (var gem in gems)
        {
            // If the gem isn't collected
            if (!gem.isCollected)
            {
                // Collect it!
                gem.Collect();
            }
        }
    }
}
