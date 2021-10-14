using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class UIFigureDetailView : MonoBehaviour
{
	public ItemRendererBehaviour itemRenderer;
	public Button uiButtonBack;
	public Text uiTextItemName;
	public Text uiTextItemDesc;
	public RawImage itemImage;
	public EventTrigger dragBox;
}
