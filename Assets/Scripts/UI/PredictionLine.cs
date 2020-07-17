using UnityEngine;
using System.Collections;

using UnityEngine.UI;

public class PredictionLine : MonoBehaviour
{
    public int opacityDistance = 4;
    public GameObject sprite;
    public int stepAmount = 10;
    public float stepSize = 10f;
    public LayerMask ignoreLayers;

    private Image[] sprites;
    
    private Vector3 startPosition;
    private Vector3 startVelocity;
    private Vector3 gravity;
    
    private void OnDisable()
    {
        if (sprites.Length == 0)
            return;

        for (int i = 0; i < stepAmount; i++)
        {
            sprites[i].gameObject.SetActive(false);
        }
    }

    private void Start()
    {
        sprites = new Image[stepAmount];
        for (int i = 0; i < sprites.Length; i++)
        {
            GameObject clone = Instantiate(sprite, transform);
            clone.SetActive(false); // Deactivate
            sprites[i] = clone.GetComponent<Image>();
        }
    }

    private void FixedUpdate()
    {
        Vector3 previousPos = startPosition;
        Vector3 position = startPosition;
        Vector3 velocity = startVelocity;
        int stopIndex = 0;
        for (int i = 0; i < stepAmount; i++)
        {
            position += velocity * stepSize * Time.fixedDeltaTime;
            velocity += gravity * stepSize * Time.fixedDeltaTime;
            Physics2D.queriesHitTriggers = false;
            RaycastHit2D hit = Physics2D.Linecast(previousPos, position, ~ignoreLayers);
            if(hit.collider)
            {
                stopIndex = i;
                break;
            }
            float opacity = 1 - ((float)1 / (float)opacityDistance * (float)i);
            Color color = sprites[i].color;
            color.a = opacity;
            sprites[i].color = color;
            sprites[i].transform.position = position;
            sprites[i].gameObject.SetActive(true);
            previousPos = position;
        }
        for (int i = stopIndex; i < stepAmount; i++)
        {
            sprites[i].gameObject.SetActive(false);
        }
    }
    
    private float Angle(Vector2 dir)
    {
        if (dir.x < 0)
            return 360 - (Mathf.Atan2(dir.x, dir.y) * Mathf.Rad2Deg * -1);
        return Mathf.Atan2(dir.x, dir.y) * Mathf.Rad2Deg;
    }

    public void SetTrajectory(Vector3 startPosition, Vector3 startVelocity, Vector3 gravity = default(Vector3))
    {
        this.startPosition = startPosition;
        this.startVelocity = startVelocity;
        this.gravity = gravity;
    }
}
