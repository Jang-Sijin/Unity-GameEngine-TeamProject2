using UnityEngine;
using UnityEngine.UI;

public class LobbyCollectionMusicBehaviour : MonoBehaviour
{
	public LobbyBehaviour lobby;
	public WCanvasGroupCrossFader collectionMenu;
	public WCanvasGroupCrossFader fader;
	public Selectable[] firstSelectables;
	public Text title;
	public WListBox listBox;
	public WListItem listItem;
	public Transform equalizer;
	public Image equalizerBlock;
	public int equalizerRowBlocks;
	public int equalizerColBlocks;
	public Vector2 equalizerBlockSize;
	public float equalizerGhostingTime;
}
