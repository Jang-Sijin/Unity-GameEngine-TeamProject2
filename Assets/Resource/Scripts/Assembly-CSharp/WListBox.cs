using UnityEngine.UI;
using System;
using UnityEngine.Events;

public class WListBox : Selectable
{
	[Serializable]
	public class WListBoxEvent : UnityEvent<int>
	{
	}

	public enum Direction
	{
		Vertical = 0,
		Horizontal = 1,
	}

	public ScrollRect scrollRect;
	public Direction direction;
	public Text text;
	public string textLanguageID;
	public WGUI.Transition textTransition;
	public Image prev;
	public Image next;
	public Graphic focus;
	public WListBoxEvent onSelChanged;
	public bool isUpdateFocusState;
}
