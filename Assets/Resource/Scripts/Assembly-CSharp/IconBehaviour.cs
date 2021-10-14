using UnityEngine;

public class IconBehaviour : MonoBehaviour
{
	public enum ViewType
	{
		AlwaysShow = 0,
		OnlyMainCamera = 1,
		OnlyPointCamera = 2,
	}

	public new Transform transform;
	public ViewType viewType;
	public LevelofDifficulty difficulty;
	public Sprite enabledIcon;
	public Sprite disabledIcon;
	public GameObject activeObject;
	public GameObject disableObject;
	public int requiredItemID;
	public LightControllerBehaviour lightController;
	public string text;
	public bool localization;
}
