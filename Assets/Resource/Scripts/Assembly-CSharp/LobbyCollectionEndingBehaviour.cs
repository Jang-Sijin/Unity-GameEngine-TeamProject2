using UnityEngine;
using UnityEngine.UI;

public class LobbyCollectionEndingBehaviour : MonoBehaviour
{
	public LobbyBehaviour lobby;
	public WCanvasGroupCrossFader addContentsCostumeFader;
	public MenuListGroup menuListGroup;
	public MenuListGroup detailListGroup;
	public WCanvasGroupCrossFader collectionMenu;
	public WCanvasGroupCrossFader fader;
	public Transform photoFrame;
	public Transform puzzle;
	public Image completedPhoto;
	public Transform photoFrameSub;
	public Transform puzzleSub;
	public Image completedPhotoSub;
	public Image completedPhotoSubPieces;
	public UIImageNumbers completedPercent;
	public UIImageNumbers SubcompletedPercent;
	public GameObject SubcompletedPercentUnder;
	public UIConstumeLinkButton reward;
	public WCanvasGroupCrossFader descriptionFader;
	public GameObject descriptionPopupBox;
	public Text endingTitle;
	public Text[] difficulties;
	public Text endingCompletedPercent;
	public GameObject replayEnding;
	public Transform leavesPanel;
	public GameObject leaf1;
	public GameObject leaf2;
	public GameObject leaf3;
	public int maxLeaves;
	public Vector3 windBlow;
}
