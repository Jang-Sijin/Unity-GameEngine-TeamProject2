using UnityEngine;
using UnityEngine.UI;

public class LobbyBehaviour : MonoBehaviour
{
	public SelectableGroup mainMenuTypeA;
	public SelectableGroup mainMenuTypeB;
	public ScreenFaderBehaviour screenFader;
	public WCanvasGroupCrossFader panelBackgroundFader;
	public GameObject continueButton;
	public Text continueDescription;
	public LobbyCollectionEndingBehaviour endingCollection;
	public Sprite[] logoSprites;
	public GameObject ambienceLobbyGameObject;
	public Text[] textVersions;
}
