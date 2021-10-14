using System;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class LeftRightSelectable : SelectableEx
{
	[Serializable]
	public struct SelectData
	{
		public string text;
		public int index;
	}
	
	public Image leftArrow;
	public Image rightArrow;
	// public EventTrigger.TriggerEvent leftRightCallback;
	public string leftRightAudioName;
	public SelectData[] selectData;
	public Text infoLabel;
}
