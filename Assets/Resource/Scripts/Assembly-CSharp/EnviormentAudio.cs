using UnityEngine;
using System.Collections.Generic;

public class EnviormentAudio : MonoBehaviour
{
	[SerializeField]
	private EnviormentAudioTrigger m_EnviormentAudioTrigger;
	[SerializeField]
	private EnviormentAudioType m_AudioType;
	[SerializeField]
	private List<EnviormentAudioGroup> m_EnviormentAudioGroupList;
	[SerializeField]
	private bool m_IsPlaying;
	[SerializeField]
	private float m_Probability;
	[SerializeField]
	private float m_IncreaseProbability;
	[SerializeField]
	private float m_DecreaseProbability;
	[SerializeField]
	private float m_LifeTime;
	[SerializeField]
	private float m_CurrentLifeTime;
}
