using UnityEngine;

public class DynamicBoneCollider : MonoBehaviour
{
	public enum Direction
	{
		X = 0,
		Y = 1,
		Z = 2,
	}

	public enum Bound
	{
		Outside = 0,
		Inside = 1,
	}

	public Vector3 m_Center;
	public float m_Radius;
	public float m_Height;
	public Direction m_Direction;
	public Bound m_Bound;
}
