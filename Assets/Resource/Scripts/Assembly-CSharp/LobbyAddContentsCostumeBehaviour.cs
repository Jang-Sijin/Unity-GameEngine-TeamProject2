using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using uTools;

public class LobbyAddContentsCostumeBehaviour : MonoBehaviour
{
	public LobbyBehaviour lobby;
	public WCanvasGroupCrossFader addContentsMenu;
	public WCanvasGroupCrossFader fader;
	public WCanvasGroupCrossFader collectionCostumeFader;
	public WCanvasGroupCrossFader collectionEndingFader;
	public WCanvasGroupCrossFader collectionFigureFader;
	public WCanvasGroupCrossFader collectionGhostFader;
	public SelectableGroup characterGroup;
	public GameObject[] models;
	public RuntimeAnimatorController[] animators;
	public GameObject costumeDetail;
	public Image iconLock;
	public RectTransform characterViewer;
	public GameObject meshRenderer;
	public Transform meshRendererCamera;
	public Light meshRendererLight;
	public EventTrigger dragBox;
	public Text costumeName;
	public Text costumeDesc;
	public GameObject info;
	public Text infoText;
	public Vector3[] cameraModelPositions;
	public uTweenRotation imageLoading;
	public Material grayScaleMaterial;
	public GameObject backGround;
	[SerializeField]
	private GameObject[] m_CharacterInstantiateCaches;
	public StandaloneInputModule inputModule;
	public StandaloneGameInputModule inputGameModule;
	public SelectableGroup costumeGroup;
	public ScrollRect costumeListScrollRect;
	[SerializeField]
	private Vector3 mLmitAngle;
	public RawImage previewCharacterImage;
}
