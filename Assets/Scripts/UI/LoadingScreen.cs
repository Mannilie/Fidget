using UnityEngine;
using UnityEngine.UI;
public class LoadingScreen : MonoBehaviour
{
    #region Singleton
    public static LoadingScreen Instance;
    // The text that shows how much has been loaded:
    private void Awake()
    {
        Instance = this;
    }
    #endregion

    
}
