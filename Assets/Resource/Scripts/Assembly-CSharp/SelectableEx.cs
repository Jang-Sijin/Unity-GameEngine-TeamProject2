using UnityEngine.UI;
using UnityEngine.EventSystems;

public class SelectableEx : Selectable
{
	public Graphic selectGraphic;
	public Graphic targetGraphic2;
	public ColorBlock targetGraphicColor;
	// public EventTrigger.TriggerEvent submitCallback;
	public string submitAudioName;
	// public EventTrigger.TriggerEvent selectCallback;
	public string selectAudioName;
	public bool isMute;
	public bool autoEnableSelect;
	public bool prevNavigationSelectableCache;
	public SelectableEffect selectableEffect;
}
