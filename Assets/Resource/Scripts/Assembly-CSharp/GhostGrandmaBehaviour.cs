using UnityEngine;

public class GhostGrandmaBehaviour : MonoBehaviour
{
	public GameObject grandmaPrefab;
	public float maxAngle;
	public float viewAngle;
	public Vector3[] posAdjust;
	public Vector3[] rotAdjust;
	public string reactionSound;
	public EventTrigger clearTrigger;
}
