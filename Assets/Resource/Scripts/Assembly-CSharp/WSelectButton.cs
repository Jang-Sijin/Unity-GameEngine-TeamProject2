using UnityEngine.UI;
using System;
using UnityEngine.Events;
using UnityEngine;

public class WSelectButton : Selectable
{
	[Serializable]
	public class Value
	{
		public string text;
		public int userData;
	}

	[Serializable]
	public class WSelectButtonEvent : UnityEvent<int>
	{
	}

	[SerializeField]
	private int Selected;
	public Text text;
	public string textLanguageID;
	public WGUI.Transition textTransition;
	public Image left;
	public Image right;
	public Text center;
	public Graphic focus;
	public Value[] values;
	public bool useLanguageIDValue;
	public string clickSound;
	public string overSound;
	public WSelectButtonEvent onValueChanged;
}
