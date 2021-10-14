using UnityEngine;

public class GhostShadowBehaviour : MonoBehaviour
{
	public enum MovePath
	{
		NONE = 0,
		Line = 1,
		Triangle = 2,
		Quadrangle = 3,
		rectangle = 4,
	}

	public float movespeed;
	public float attackRange;
	public Transform headTransform;
	public MovePath eMovePath;
	public float MoveDistance;
	public float MaxTargetDistante;
	public bool bIsTargeting;
	public float phaseTime;
	public float sightAngleMin;
	public float sightAngleMin1;
	public float GhostDistance;
	public float GhostDistanc1;
	public float GhostDistance2;
	public float PursuitTime;
	public float Breath;
	public float Damage;
	public bool IndicatorState;
}
