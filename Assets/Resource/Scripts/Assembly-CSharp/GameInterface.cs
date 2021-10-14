using UnityEngine;
using UnityEngine.UI;

public class GameInterface : MonoBehaviour
{
	public enum e_DyingMessageType
	{
		None = 0,
		EunMiChase = 1,
		BlackGhost = 2,
	}

	public GameObject controlls;
	public GameObject controllsOfPointView;
	public InventoryBehaviour inventory;
	public SavePanelBehaviour savePanel;
	public VirtualPadBehaviour virtualPad;
	public QteEventBehaviour qtePanel;
	public BloodyRectBehaviour bloodyRect;
	public MonologueMessageBarBehaviour monologueMessageBar;
	public Animator mailReceiver;
	public TimeAttackAlarmBehaviour timeAttack;
	public Animator eyeSearching;
	public GameObject eyeSearchingSelect;
	public InteractiveIconBehaviour interactiveIcon;
	public InGameCaptionBehaviour inGameCaption;
	public GameObject autoSaveIcon;
	public GameObject diePanel;
	public Text dieDescription;
	public Text dieMagicPenCount;
	public e_DyingMessageType dyingMessageType;
	public LetterBoxBehaviour letterbox;
	public CinemaSkipFaderBehaviour cinemaSkipFader;
	public UITutorial tutorial;
	public Sprite[] itemIcons;
	public GameObject helpPanel;
	public bool IsActivePanel;
	public Text debugText;
	public GameObject BlackBackGround;
}
