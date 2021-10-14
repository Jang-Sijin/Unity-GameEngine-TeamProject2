using UnityEngine;

public class CullingMaskBehaviour : MonoBehaviour
{
	public enum MoveDirection
	{
		Fixed = 0,
		PositiveX = 1,
		NegativeX = 2,
		PositiveZ = 3,
		NegativeZ = 4,
	}

	public enum DistanceCheck
	{
		All = 0,
		AxisX = 1,
		AxisZ = 2,
	}

	public Transform plane;
	public MoveDirection moveDirection;
	public DistanceCheck distanceCheck;
	public float maxDistance;
}
