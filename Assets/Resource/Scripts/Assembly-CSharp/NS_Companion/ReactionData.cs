using System;
using UnityEngine;

namespace NS_Companion
{
	[Serializable]
	public class ReactionData
	{
		public bool m_Fold;
		public bool m_Indispensable;
		public ReactionConditionType m_ConditionType;
		public float m_fElapseTime;
		public Vector3 m_TriggerPos;
		public float m_TriggerRadius;
		public string m_SpeechID;
		public string m_Sound;
		public uint m_AnimationTrigger;
		public ReactionResult m_Result;
	}
}
