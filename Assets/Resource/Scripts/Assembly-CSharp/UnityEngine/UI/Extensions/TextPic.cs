using UnityEngine.UI;
using System;
using UnityEngine;
using UnityEngine.Events;

namespace UnityEngine.UI.Extensions
{
	public class TextPic : Text
	{
		[Serializable]
		public struct IconName
		{
			public string name;
			public Sprite sprite;
		}

		[Serializable]
		public class HrefClickEvent : UnityEvent<string>
		{
		}

		public IconName[] inspectorIconList;
		public IconName[] PS4IconList;
		public IconName[] SteamIconList;
		public int iconSize;
		public float ImageScalingFactor;
		public string hyperlinkColor;
		[SerializeField]
		public Vector2 imageOffset;
		public bool isCreating_m_HrefInfos;
		[SerializeField]
		private HrefClickEvent m_OnHrefClick;
	}
}
