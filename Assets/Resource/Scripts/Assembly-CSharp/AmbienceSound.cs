using UnityEngine;

public class AmbienceSound : MonoBehaviour
{
	[SerializeField]
	protected float m_FadeDuration;
	[SerializeField]
	private AnimationCurve m_FadeVolumeCurve;
	[SerializeField]
	protected float m_MinVolume;
	[SerializeField]
	protected float m_MaxVolume;
	[SerializeField]
	protected bool m_IsUpdate;
	[SerializeField]
	protected string m_TriggerTargetTag;
}
