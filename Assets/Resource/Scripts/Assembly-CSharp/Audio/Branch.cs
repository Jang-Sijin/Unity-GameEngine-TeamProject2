using System;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class Branch : Node
	{
		[SerializeField]
		private BoolParameter m_BoolParam;
	}
}
