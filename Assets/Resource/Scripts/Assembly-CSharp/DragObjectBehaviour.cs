using UnityEngine;

public class DragObjectBehaviour : MonoBehaviour
{
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
	public Vector3 positionGrid;
	public Vector3 rotationGrid;
	public Vector3 position;
	public Vector3 rotation;
	public Vector3 initPosition;
	public string limitSound;
	public string moveSound;
	public string rotateSound;
	public float soundPeriodTime;
	public bool bPictureDepth;
	public bool bIsDial;
}
