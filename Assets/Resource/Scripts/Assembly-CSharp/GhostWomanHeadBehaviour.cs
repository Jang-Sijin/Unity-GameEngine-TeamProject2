using UnityEngine;

public class GhostWomanHeadBehaviour : MonoBehaviour
{
	[SerializeField]
	private float moveInterval;
	public float spawnDistance;
	public float moveSpeed;
	public float maxTime;
	public float escapeDistance;
	public float attackableDistance;
	public float fogStart;
	public float fogEnd;
	public string ghostSoundName;
	public string attackHitSoundName;
	public string reaction1SoundName;
	public string reaction2SoundName;
	public float cooltime;
	public float attackWaitTime;
	public MeshRenderer[] renderers;
	public bool isVisiblity;
	[SerializeField]
	private float m_CannotJumpDistance;
	[SerializeField]
	private float m_DistanceReactionFar;
	[SerializeField]
	private float m_DistanceReactionNear;
}
