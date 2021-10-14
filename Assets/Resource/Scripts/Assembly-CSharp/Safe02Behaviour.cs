using UnityEngine;

public class Safe02Behaviour : MonoBehaviour
{
	public enum Direction
	{
		None = 0,
		CW = 1,
		CCW = 2,
	}

	public DragObjectBehaviour dialObject;
	public Direction initDirection;
	public GameObject[] digits;
	public string tickSound;
}
