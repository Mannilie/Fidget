using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Events;

public class DragPanel : MonoBehaviour, IDragHandler, IPointerUpHandler, IPointerDownHandler
{
    [Header("Options")]
    [Range(0f, 2f)] public float handleScale = 1f;
    protected Vector2 inputVector = Vector2.zero;
    [Header("Components")]
    public RectTransform start;
    public RectTransform end;
    public float Horizontal { get { return inputVector.x; } }
    public float Vertical { get { return inputVector.y; } }
    public Vector2 Direction { get { return new Vector2(Horizontal, Vertical); } }
    public float Distance { get { return (startPosition - endPosition).magnitude; } }

    public Vector2 startPosition;
    public Vector2 endPosition;
    public bool isDragging = false;
    public bool isPointerUp = false;
    public bool isPointerDown = false;

    private RectTransform rect;

    void Start()
    {
        rect = GetComponent<RectTransform>();
    }
    void LateUpdate()
    {
        isPointerDown = false;
        isPointerUp = false;
    }

    public void OnDrag(PointerEventData eventData)
    {
        Vector2 direction = eventData.position - startPosition;
        endPosition = startPosition + direction * handleScale;
        end.position = endPosition;
        inputVector = endPosition - startPosition;
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        isDragging = true;
        startPosition = eventData.position;
        start.position = startPosition;
        isPointerDown = true;
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        isDragging = false;
        endPosition = eventData.position;
        end.position = endPosition;
        isPointerUp = true;
    }
}
