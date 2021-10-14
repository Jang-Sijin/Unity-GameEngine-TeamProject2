using System;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class Modulator : Node
	{
		[SerializeField]
		private float m_MinPitch;
		[SerializeField]
		private float m_MaxPitch;
		[SerializeField]
		private float m_MinVolume;
		[SerializeField]
		private float m_MaxVolume;
	}
}
