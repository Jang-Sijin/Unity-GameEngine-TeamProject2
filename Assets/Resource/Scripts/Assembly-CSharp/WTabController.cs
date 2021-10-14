using UnityEngine;
using System;
using UnityEngine.Events;

public class WTabController : MonoBehaviour
{
	[Serializable]
	public class TabControllerEvent : UnityEvent<int>
	{
	}

	public WTabButton[] tabs;
	[SerializeField]
	private int Selected;
	public bool popupTab;
	public bool allowOffAll;
	public TabControllerEvent onValueChanged;
}
