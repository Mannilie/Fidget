using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public enum SurfaceDirection
{
    NULL,
    ROOF,
    FLOOR,
    WALL,
}
public enum SurfaceType
{
    NULL,
    NORMAL,
    BOUNCE,
    SLIDE,
    DEATH,
    ROCKS
}

public class SurfaceEvent : UnityEvent<SurfaceType> { }

[RequireComponent(typeof(CircleCollider2D))]
public class SurfaceController : MonoBehaviour
{
    public float radius = 15f;
    public float rotationSpeed = 10f;
    public float positionOffsetY = .25f;
    public LayerMask hitLayers;
    public Vector3 closestPoint;
    public Vector3 normal;
    public SurfaceEvent onSurfaceHit = new SurfaceEvent();
    public SurfaceEvent onSurfaceExit = new SurfaceEvent();
    private RaycastHit2D closestHit;
    private Rigidbody2D rigid;
    
    public SurfaceType surfaceType;
    [HideInInspector] public bool isStuck = false;
    [HideInInspector] public new Collider2D collider;

    private void Awake()
    {
        rigid = GetComponent<Rigidbody2D>();
    }
    private void OnDrawGizmos()
    {
        Gizmos.color = Color.blue;
        Gizmos.DrawWireSphere(transform.position, radius);
        Gizmos.color = Color.blue;
        Gizmos.DrawSphere(transform.position, 0.1f);
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(closestPoint, 0.1f);
    }
    private void Update()
    {
        if (isStuck)
        {
            collider = CalculateSurface();
            // Adjust Player Position & Rotation
            float angle = Mathf.Atan2(normal.y, normal.x) * Mathf.Rad2Deg;
            Quaternion normalRotation = Quaternion.AngleAxis(angle - 90f, Vector3.forward);
            transform.rotation = Quaternion.Lerp(transform.rotation, normalRotation, rotationSpeed * Time.deltaTime);
            transform.position = closestPoint + normal * positionOffsetY;
        }
    }
    private void OnCollisionEnter2D(Collision2D col)
    {
        collider = CalculateSurface();
        onSurfaceHit.Invoke(surfaceType);
    }
    private Collider2D CalculateSurface()
    {
        Physics2D.queriesHitTriggers = false;
        RaycastHit2D[] hits = Physics2D.CircleCastAll(transform.position, radius, Vector2.zero, 1000f, hitLayers);
        if (hits.Length == 0)
            return null;
        closestHit = GetClosestHit(hits);
        // Calculate Normal of Surface 
        Quaternion normalRotation = GetRotationToNormal(closestHit.normal, 90f);
        normal = normalRotation * Vector3.up;
        var collider = closestHit.collider;
        if (!collider)
            return null; // nothing to do without a collider
        surfaceType = GetSurfaceType(collider);
        if (surfaceType == SurfaceType.NORMAL)
        {
            closestPoint = collider.ClosestPoint(transform.position);
        }
        return collider;
    }
    public Quaternion GetRotationToNormal(Vector2 normal, float offsetRotation)
    {
        float angle = Mathf.Atan2(normal.y, normal.x) * Mathf.Rad2Deg;
        return Quaternion.AngleAxis(angle - offsetRotation, Vector3.forward);
    }
    public RaycastHit2D GetClosestHit(RaycastHit2D[] hits)
    {
        RaycastHit2D closest = default;
        float minDistance = float.MaxValue;
        foreach (var hit in hits)
        {
            float distance = Vector2.Distance(transform.position, hit.point);
            if (distance < minDistance)
            {
                closest = hit;
                minDistance = distance;
            }
        }
        return closest;
    }
    public SurfaceType GetSurfaceType(Collider2D col)
    {
        if (col)
        {
            switch (col.tag)
            {
                case "Normal":
                case "Checkpoint":
                    return SurfaceType.NORMAL;
                case "Bounce": return SurfaceType.BOUNCE;
                case "Slide": return SurfaceType.SLIDE;
                case "Death": return SurfaceType.DEATH;
                case "Rocks": return SurfaceType.ROCKS;
                default: return SurfaceType.NULL;
            }
        }
        return SurfaceType.NULL;
    }
    public void Stick()
    {
        rigid.velocity = Vector3.zero;
        rigid.constraints = RigidbodyConstraints2D.FreezeAll;
        isStuck = true;
    }
    public void UnStick()
    {
        surfaceType = SurfaceType.NULL;
        rigid.constraints = RigidbodyConstraints2D.None;
        isStuck = false;
        onSurfaceExit.Invoke(surfaceType);
    }
}
