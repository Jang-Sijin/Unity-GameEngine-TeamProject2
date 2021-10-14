using UnityEngine;

public class RainGroup : MonoBehaviour
{
	[SerializeField]
	private bool m_IsRaining;
	[SerializeField]
	private int m_BeginRainSeconds;
	[SerializeField]
	private int m_RainStateChangeCheckSeconds;
	[SerializeField]
	private int m_RainStateChangeMinSeconds;
	[SerializeField]
	private int m_RainStateChangeMaxSeconds;
	[SerializeField]
	private float m_RainStateSeconds;
	[SerializeField]
	private ERainState m_RainState;
	[SerializeField]
	private float m_UpdateTick;
	[SerializeField]
	private float m_PlayTime;
	[SerializeField]
	private RainController[] m_RainControllers;
	public float normalRainWindowPitch;
	public float normalRainWindowVolume;
	public AnimationCurve moodVolumeCulve;
}
