using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class LobbyCollectionFigureBehaviour : MonoBehaviour
{
	public LobbyBehaviour lobby;
	public WCanvasGroupCrossFader addContentsCostumeFader;
	public SelectableGroup selectableGroup;
	public WCanvasGroupCrossFader collectionMenu;
	public WCanvasGroupCrossFader fader;
	public GameObject figureHeeMin;
	public GameObject figureSoYoung;
	public GameObject figureSungA;
	public GameObject figureJiHyeon;
	public GameObject figureEunMi;
	public GameObject figureDalSu;
	public GameObject figureBongGoo;
	public WCanvasGroupCrossFader descriptionFader;
	public ItemRendererBehaviour itemRenderer;
	public Text figureName;
	public Text figureDescription;
	public EventTrigger dragBox;
	public UIConstumeLinkButton reward;
	public UIImageNumbers collectCounter;
}
