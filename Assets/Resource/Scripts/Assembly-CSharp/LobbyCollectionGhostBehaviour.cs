using UnityEngine;
using UnityEngine.UI;

public class LobbyCollectionGhostBehaviour : MonoBehaviour
{
	public LobbyBehaviour lobby;
	public WCanvasGroupCrossFader addContentsCostumeFader;
	public WCanvasGroupCrossFader collectionMenu;
	public WCanvasGroupCrossFader fader;
	public GhostList ghostList;
	public SelectableTextView selectableTextView;
	public WCanvasGroupCrossFader mainPanelFader;
	public WCanvasGroupCrossFader descPanelFader;
	public WCanvasGroupCrossFader descPopupPanelFader;
	public Text ghostStoryTitle;
	public GhostListItem descriptionGhost;
	public UIImageNumbers curEncountCounter;
	public UIImageNumbers maxEncountCounter;
	public UIImageNumbers curStoryCounter;
	public UIImageNumbers maxStoryCounter;
	public UIConstumeLinkButton reward;
	public Transform maze;
	public Vector3 ghostScrollPos;
	public SelectableGroup selectableGroup;
}
