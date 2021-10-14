using UnityEngine;

public class AttenuationAudio : MonoBehaviour
{
	[SerializeField]
	private bool autoStop;
	[SerializeField]
	private string m_TriggerTargetTag;
	[SerializeField]
	private AnimationCurve m_AnimationCurve;
	[SerializeField]
	private Vector3 m_Extend;
	[SerializeField]
	private Vector3 m_AddExtend;
	[SerializeField]
	private bool m_IsUpdate;
	[SerializeField]
	private float m_MaxVolume;
}
