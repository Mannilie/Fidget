using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

public class RuntimePlatformEvent : MonoBehaviour
{
    public UnityEvent onAndroidOrIOS, onStandalone;
    
    private void OnEnable()
    {
#if UNITY_STANDALONE || UNITY_WEBGL
        onStandalone.Invoke();
#elif UNITY_ANDROID || UNITY_IOS 
        onAndroidOrIOS.Invoke();
#endif
    }
}
