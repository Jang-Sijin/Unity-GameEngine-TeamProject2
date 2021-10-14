using System;
using UnityEngine;
using System.Collections.Generic;

namespace Audio
{
	[Serializable]
	public class RandomOnce : Node
	{
		[SerializeField]
		private int m_CacheRandomIndex;
		[SerializeField]
		private List<float> m_InputRandomInfoList;
	}
}
