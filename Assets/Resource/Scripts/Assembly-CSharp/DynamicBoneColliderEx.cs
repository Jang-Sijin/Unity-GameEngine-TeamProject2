using UnityEngine;

public class DynamicBoneColliderEx : MonoBehaviour
{
	public enum Direction
	{
		X = 0,
		Y = 1,
		Z = 2,
	}

	public Vector3 center;
	public Direction direction;
	public float radius;
	public float height;
}
