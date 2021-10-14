using UnityEngine;

public class SecurityGuardBgm : MonoBehaviour
{
	[SerializeField]
	private string[] m_ArroundAudioNames;
	[SerializeField]
	private string[] m_CloseAudioNames;
	[SerializeField]
	private string[] m_DetectAudioNames;
	[SerializeField]
	private float m_ArroundDistance;
	[SerializeField]
	private float m_ArroundFadeOutDistance;
	[SerializeField]
	private float m_ArroundBgmFadeTime;
	[SerializeField]
	private float m_CloseDistance;
	[SerializeField]
	private float m_DetectBgmFadeTime;
}
