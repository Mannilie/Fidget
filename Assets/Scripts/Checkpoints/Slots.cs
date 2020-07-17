using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Slots : MonoBehaviour
{
    public int maxGemLength = 6;
    public GameObject[] slots;
    private int length = 0;

    public int Length
    {
        get
        {
            if(length != 0)
            {
                return length;
            }
            return slots.Length;
        }
    }
    
    void DisableAll()
    {
        for (int i = 0; i < slots.Length; i++)
        {
            slots[i].SetActive(false);
        }
    }
    public Transform GetSlot(int index)
    {
        GameObject slot = slots[index];
        return slot.transform;
    }
    public void SetLength(int length)
    {
        this.length = length;

        DisableAll();
        for (int i = 0; i < length; i++)
        {
            slots[i].SetActive(true);
        }
    }
}
