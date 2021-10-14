using UnityEngine;
using UnityEngine.UI;

public class InventoryDocumentBehaviour : MonoBehaviour
{
	public InventoryBehaviour inventory;
	public InventoryList documentList;
	public InventoryTabMenu tabMenu;
	public Sprite iconUnread;
	public Sprite iconRead;
	public Text title;
	public Image sorcery;
	public Image[] papers;
	public Sprite[] paperImages;
	public Text[] paperTexts;
	public ScrollRect paperScrollRect;
	public string selectAudioName;
}
