using UnityEngine;
using System.Collections.Generic;

public class EnviormentAudioManager : MonoBehaviour
{
	[SerializeField]
	private string m_TriggerTargetTag;
	[SerializeField]
	private float m_EnableCheckTime;
	[SerializeField]
	private float m_EnableTime;
	[SerializeField]
	private bool m_IsUpdate;
	[SerializeField]
	private List<EnviormentAudio> m_EnviormentAudioTriggerList;
}
