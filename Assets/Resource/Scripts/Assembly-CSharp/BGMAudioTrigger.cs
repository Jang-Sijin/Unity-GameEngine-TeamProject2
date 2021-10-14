using UnityEngine;

public class BGMAudioTrigger : BGMAudio
{
	[SerializeField]
	protected string m_TriggerTargetTag;
	[SerializeField]
	private float m_UpdateTick;
	public bool UseAssetBundle;
}
