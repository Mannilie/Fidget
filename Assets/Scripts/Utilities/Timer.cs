using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Timer : MonoBehaviour
{
    public float elapsedTime = 0.0f;
   
    public void Update()
    {
        elapsedTime += Time.deltaTime;
    }

    public void Reset(float fromTime)
    {
        elapsedTime = fromTime;
    }
}
