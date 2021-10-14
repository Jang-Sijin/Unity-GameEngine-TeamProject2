using System;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class AudioData
	{
		[SerializeField]
		private string m_AudioName;
		[SerializeField]
		private bool m_Loop;
		[SerializeField]
		private float m_Volume;
		[SerializeField]
		private float m_Pitch;
		[SerializeField]
		private float m_MinDistance;
		[SerializeField]
		private float m_MaxDistance;
		[SerializeField]
		private float m_SpatialBlend;
	}
}
