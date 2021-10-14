using System;
using UnityEngine;
using System.Collections.Generic;

namespace NS_Companion
{
	[Serializable]
	public class CommonReactionData : ScriptableObject
	{
		public bool m_Fold;
		public string m_DataName;
		public AnimatorOverrideController m_AnimatorController;
		public ReactionData m_FinalReaction;
		public ReactionData m_ConnectReaction;
		public ReactionData m_SitReaction;
		public List<ReactionData> m_TouchReaction;
	}
}
