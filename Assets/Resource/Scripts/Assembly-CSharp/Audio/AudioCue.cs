using System;
using UnityEngine;
using System.Collections.Generic;

namespace Audio
{
	[Serializable]
	public class AudioCue : ScriptableObject
	{
		[SerializeField]
		private AudioData m_AudioData;
		[SerializeField]
		private AudioOutPut m_AudioOutput;
		[SerializeField]
		private List<Node> m_NodeList;
	}
}
