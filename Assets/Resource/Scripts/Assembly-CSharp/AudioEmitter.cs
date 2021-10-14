using UnityEngine;

public class AudioEmitter : MonoBehaviour
{
	public enum OccluderMode
	{
		Volume = 0,
		LowPassFilter = 1,
	}

	public bool IsSimple;
	public bool PlayOnStart;
	[SerializeField]
	private LayerMask m_OcclusionLayer;
	[SerializeField]
	private float m_UpdateTick;
	[SerializeField]
	private float m_Space;
	[SerializeField]
	private AnimationCurve m_PermeationVolumeCurve;
	[SerializeField]
	private float m_VolumeDuration;
	[SerializeField]
	private OccluderMode m_OccluderMode;
	[SerializeField]
	private float MULTIPLICATION_PERMEATION;
}
