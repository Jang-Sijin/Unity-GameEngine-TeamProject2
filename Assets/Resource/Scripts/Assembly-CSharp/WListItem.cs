using UnityEngine.UI;
using System;
using UnityEngine.Events;

public class WListItem : Button
{
	[Serializable]
	public class ListItemFocusEvent : UnityEvent<bool>
	{
	}

	public WListBox listBox;
	public int userData;
	public Text text;
	public WGUI.Transition textTransition;
	public Image icon;
	public WGUI.Transition iconTransition;
	public Graphic graphic;
	public Toggle.ToggleTransition toggleTransition;
	public Graphic focus;
	public string clickSound;
	public string overSound;
	public WButton Activebutton;
	public ListItemFocusEvent onFocusChanged;
	public ListItemFocusEvent OnPointChanged;
}
