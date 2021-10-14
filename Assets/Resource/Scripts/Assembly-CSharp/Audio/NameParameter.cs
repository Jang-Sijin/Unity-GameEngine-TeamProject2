using System;
using UnityEngine;

namespace Audio
{
	[Serializable]
	public class NameParameter : ScriptableObject
	{
		[SerializeField]
		private string m_ParameterName;
	}
}
