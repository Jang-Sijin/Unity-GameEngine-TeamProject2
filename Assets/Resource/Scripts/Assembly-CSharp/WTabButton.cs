using UnityEngine.UI;
using System;
using UnityEngine.Events;
using UnityEngine;

public class WTabButton : Button
{
	[Serializable]
	public class WTabButtonEvent : UnityEvent<bool>
	{
	}

	[SerializeField]
	private bool IsOn;
	public WTabController tabController;
	public GameObject panel;
	public Sprite tabOnSprite;
	public Text text;
	public string textLanguageID;
	public WGUI.Transition textTransition;
	public Graphic selected;
	public Graphic focus;
	public string clickSound;
	public string overSound;
	public WTabButtonEvent onValueChanged;
}
