using UnityEngine;

public class HoldableObject : MonoBehaviour
{
	public enum HoldObjectTypes
	{
		None = 0,
		Ladder = 2,
		Talisman = 3,
		Carried = 4,
		Speaker = 5,
		LRod = 6,
	}

	public enum HoldObjectTransformUpdate
	{
		None = 0,
		Sweep = 1,
		Offset = 2,
	}

	public bool isTestUpdate;
	[SerializeField]
	private HoldObjectTypes m_HoldObjectType;
	[SerializeField]
	private Vector3 m_LocalRotation;
	[SerializeField]
	private Vector3 m_LocalPosition;
	public HoldObjectTransformUpdate hldObjectTransformUpdate;
}
