using UnityEngine;

public class UVAnimation : MonoBehaviour
{
	[SerializeField]
	private Vector2 m_Speed;
	[SerializeField]
	private AnimationCurve m_AnimationCurve_U;
	[SerializeField]
	private AnimationCurve m_AnimationCurve_V;
	[SerializeField]
	private bool m_AnimateSharedMaterial;
}
