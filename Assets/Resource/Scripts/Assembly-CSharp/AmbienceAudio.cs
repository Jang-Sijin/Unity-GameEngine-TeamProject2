using UnityEngine;
using System.Collections.Generic;

public class AmbienceAudio : MonoBehaviour
{
	public enum EPlayState
	{
		None = 0,
		FadeIn = 1,
		Blank = 2,
		FadeOut = 3,
		Playing = 4,
	}

	[SerializeField]
	private EPlayState m_PlayState;
	[SerializeField]
	private float m_AmbienceFadeTime;
	[SerializeField]
	private float m_MinVolume;
	[SerializeField]
	private float m_MaxVolume;
	[SerializeField]
	private AnimationCurve m_FadeVolumeCurve;
	[SerializeField]
	private float m_ContinuePlayProbability;
	[SerializeField]
	private float m_AmbienceBlankTime;
	[SerializeField]
	private float m_VolumeLerpTime;
	[SerializeField]
	private bool m_PlayOnStart;
	[SerializeField]
	protected List<AudioClip> m_AudioList;
}
