using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Serialization;

using UnityEngine;

public class Utility
{
    public static Transform FindChildRecursive(Transform parent, string name)
    {
        Queue<Transform> queue = new Queue<Transform>();
        queue.Enqueue(parent);
        while (queue.Count > 0)
        {
            var c = queue.Dequeue();
            if (c.name == name)
                return c;
            foreach (Transform t in c)
                queue.Enqueue(t);
        }
        return null;
    }
    public static void OpenWebsite(string url)
    {
        Application.OpenURL(url);
    }

    #region File System
    public static string GetFilePath(string fileName)
    {
        return Application.persistentDataPath + "/" + fileName + ".xml";
    }
    public static void SaveData<T>(T data, string filePath)
    {
        var serializer = new XmlSerializer(typeof(T));
        using (var stream = new FileStream(filePath, FileMode.Create))
        {
            serializer.Serialize(stream, data);
        }
    }
    public static T LoadData<T>(string filePath)
    {
        if (File.Exists(filePath))
        {
            var serializer = new XmlSerializer(typeof(T));
            using (var stream = new FileStream(filePath, FileMode.Open))
            {
                return (T)serializer.Deserialize(stream);
            }
        }
        return default;
    }
    public static void Delete(string filePath)
    {
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
        }
    }
    #endregion

    #region Formatting
    public static string TimeToString(float time)
    {
        TimeSpan timeSpan = TimeSpan.FromSeconds(time);
        return string.Format("{0:00}:{1:00}:{2}", timeSpan.Minutes, timeSpan.Seconds, timeSpan.Milliseconds / 100);
    }
    #endregion
}