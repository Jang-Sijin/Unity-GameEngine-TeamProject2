using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class InventoryBackpackBehaviour : MonoBehaviour
{
	public InventoryBehaviour inventory;
	public InventoryTabMenu tabMenu;
	public InventoryList inventoryList;
	public RawImage itemImage;
	public Text itemName;
	public Text itemDescription;
	public Text itemQuantity;
	public GameObject itemUse;
	public EventTrigger dragBox;
	public string selectAudioName;
}
