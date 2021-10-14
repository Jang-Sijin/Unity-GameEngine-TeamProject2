using System;
using System.Collections.Generic;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class Random : Node
	{
		[SerializeField]
		private List<float> m_InputRandomInfoList;
	}
}
