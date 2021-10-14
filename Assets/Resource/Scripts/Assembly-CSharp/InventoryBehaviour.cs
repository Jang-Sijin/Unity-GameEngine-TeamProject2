using UnityEngine;

public class InventoryBehaviour : MonoBehaviour
{
	public CanvasGroup canvasGroup;
	public CanvasGroup[] menuCanvasGroups;
	public CanvasGroup quitCanvasGroup;
	public InventoryBackpackBehaviour backpack;
	public InventoryMapBehaviour map;
	public InventoryMailBehaviour mail;
	public InventoryDocumentBehaviour document;
	public InventorySystemBehaviour system;
	public InventoryTutorialBehaviour tutorial;
	public UIStringSetter[] InventoryUIStringSetters;
	public InventoryMenu inventoryMenu;
	public RectTransform detailPanel;
}
