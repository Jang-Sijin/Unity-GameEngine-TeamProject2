using UnityEngine;
using UnityEngine.UI;

public class InventoryMapBehaviour : MonoBehaviour
{
	public InventoryBehaviour inventory;
	public InventoryTabMenu tabMenu;
	public InventoryList inventoryList;
	public ScrollRect scrollRect;
	public GameObject[] mapMainBuilding1;
	public GameObject[] mapMainBuilding2;
	public GameObject[] mapNewBuilding;
	public GameObject[] mapHall;
	public Vector2[] mapPosAdjust;
	public float[] mapScaleAdjust;
	public Image playerMarker;
	public string selectAudioName;
}
