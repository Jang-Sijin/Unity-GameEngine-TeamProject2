using System;
using UnityEngine;
using System.Collections.Generic;

namespace Audio
{
	[Serializable]
	public class Node : ScriptableObject
	{
		public bool enabled;
		[SerializeField]
		protected List<Node> m_InputNodeList;
		[SerializeField]
		protected Node m_OutputNode;
	}
}
