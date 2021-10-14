using UnityEngine;

public class AudioReverbZoneController : MonoBehaviour
{
	public AudioReverbZone m_AudioReverbZone;
	[SerializeField]
	private bool m_EnteredTrigger;
	[SerializeField]
	private string m_TriggerTargetTag;
}
