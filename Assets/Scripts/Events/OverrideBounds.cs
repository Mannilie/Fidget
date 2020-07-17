using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OverrideBounds : MonoBehaviour
{
    public float extremeBound = 200.0f;
    public MeshFilter meshFilter;
    private void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.blue;
        Gizmos.DrawWireCube(transform.position, Vector3.one* extremeBound);
    }
    private void Update()
    {
        meshFilter.mesh.bounds = new Bounds(transform.position, Vector3.one * extremeBound);
    }
}