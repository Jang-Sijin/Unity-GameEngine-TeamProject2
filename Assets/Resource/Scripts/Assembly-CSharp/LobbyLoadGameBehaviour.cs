using UnityEngine;
using UnityEngine.UI;

public class LobbyLoadGameBehaviour : MonoBehaviour
{
	public LobbyBehaviour lobby;
	public WCanvasGroupCrossFader fader;
	public SelectableGroup menuListGroup;
	public SelectableGroup detailButtonGroup;
	public WCanvasGroupCrossFader panelFader;
	public Image savedMapImage;
	public Text savedMapName;
	public Text savedTime;
	public Text savedDifficulty;
}
