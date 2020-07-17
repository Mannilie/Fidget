using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class FixedJoystick : Joystick
{
    private Image bImage;
    private Image hImage;
    private float oBOpacity;
    private float oHOpacity;
    private Vector2 joystickPosition;

    void Start()
    {
        joystickPosition = Camera.main.WorldToScreenPoint(background.position);
        bImage = background.GetComponent<Image>();
        hImage = handle.GetComponent<Image>();

        oBOpacity = bImage.color.a;
        oHOpacity = hImage.color.a;
    }

    public override void OnDrag(PointerEventData eventData)
    {
        Vector2 direction = eventData.position - joystickPosition;
        inputVector = (direction.magnitude > background.sizeDelta.x / 2f) ? direction.normalized : direction / (background.sizeDelta.x / 2f);
        ClampJoystick();
        handle.anchoredPosition = (inputVector * background.sizeDelta.x / 2f) * handleLimit;

        bImage.color = Color.white;
        hImage.color = Color.white;
    }

    public override void OnPointerDown(PointerEventData eventData)
    {
        OnDrag(eventData);
    }

    public override void OnPointerUp(PointerEventData eventData)
    {
        inputVector = Vector2.zero;
        handle.anchoredPosition = Vector2.zero;
        ResetColor();

    }

    void ResetColor()
    {
        Color hColor = hImage.color;
        Color bColor = bImage.color;

        hColor.a = oHOpacity;
        bColor.a = oBOpacity;

        hImage.color = hColor;
        bImage.color = bColor;
    }
}