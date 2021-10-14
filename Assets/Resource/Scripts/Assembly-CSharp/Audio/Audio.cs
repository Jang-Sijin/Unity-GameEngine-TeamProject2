using System;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class Audio : Node
	{
		[SerializeField]
		private string m_AudioName;
		[SerializeField]
		private bool m_Loop;
	}
}
