using System;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class IntParameter : NameParameter
	{
		[SerializeField]
		private int m_Value;
	}
}
