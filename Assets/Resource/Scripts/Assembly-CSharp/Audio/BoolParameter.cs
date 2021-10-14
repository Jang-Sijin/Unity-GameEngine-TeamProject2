using System;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class BoolParameter : NameParameter
	{
		[SerializeField]
		private bool m_Value;
	}
}
