using UnityEngine;
using System;

public class RainController : MonoBehaviour
{
	[Serializable]
	public struct RainAudioInfo
	{
		public bool isMaintain;
		public AttenuationAudio attenuationAudio;
		public float lerpB;
		public float tempLerpB;
	}

	[Serializable]
	public struct Rain
	{
		public RainController.RainAudioInfo[] audioArr;
	}

	[SerializeField]
	private float m_FadeTime;
	[SerializeField]
	private ERainState m_RainState;
	[SerializeField]
	private ERainState m_PrevRainState;
	[SerializeField]
	private Rain[] m_Rain;
}
