using System;
using UnityEngine;
using System.Collections.Generic;

namespace NS_Companion
{
	[Serializable]
	public class CompanionData : ScriptableObject
	{
		public bool m_Fold;
		public string m_DataName;
		public CompanionType m_Type;
		public Vector3 m_StartPos;
		public Quaternion m_StartRotation;
		public float m_MoveSpeed;
		public List<Vector3> m_Waypoints;
		public List<ChaseableArea> m_ChaseableArea;
		public CommonReactionData m_CommonReaction;
		public List<ReactionData> m_Reaction;
	}
}
