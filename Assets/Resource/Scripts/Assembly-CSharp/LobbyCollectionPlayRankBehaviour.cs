using UnityEngine;
using uTools;

public class LobbyCollectionPlayRankBehaviour : MonoBehaviour
{
	public LobbyBehaviour lobby;
	public WCanvasGroupCrossFader addContentsCostumeFader;
	public WCanvasGroupCrossFader collectionMenu;
	public WCanvasGroupCrossFader fader;
	public GameObject meshRenderer;
	public Transform meshRendererCamera;
	public Light meshRendererLight;
	public int[] costumeIDs;
	public RectTransform characterViewer;
	public CanvasGroup characterViewerCanvasGroup;
	public Vector3 CameraLocation;
	public Vector3[] CharacterRenderLocation;
	public Vector3[] CharacterRenderLocationEx;
	public GameObject[] EndingList;
	[SerializeField]
	private GameObject[] characterPrefabs;
	[SerializeField]
	private GameObject[] m_CharacterCaches;
	public MenuListGroup buttonGroup;
	public uTweenRotation imageLoading;
}
