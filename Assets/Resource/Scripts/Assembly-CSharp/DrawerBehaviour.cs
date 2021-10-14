using UnityEngine;

public class DrawerBehaviour : MonoBehaviour
{
	public enum DrawerType
	{
		Close = 0,
		Opne = 1,
	}

	public bool freezePositionX;
	public bool freezePositionY;
	public bool freezePositionZ;
	public bool freezeRotationX;
	public bool freezeRotationY;
	public bool freezeRotationZ;
	public Vector3 minPosition;
	public Vector3 maxPosition;
	public Vector3 minRotation;
	public Vector3 maxRotation;
	public Vector3 rotation;
	public Vector3 initPosition;
	public string moveSound;
	public float MoveTime;
	public bool objectRotation;
	public bool AddObjectRotation;
	public DrawerType Type;
}
