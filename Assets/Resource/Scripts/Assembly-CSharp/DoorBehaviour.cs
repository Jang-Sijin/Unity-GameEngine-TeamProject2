using UnityEngine;

public class DoorBehaviour : MonoBehaviour
{
	public enum Type
	{
		PushPull = 0,
		Sliding = 1,
	}

	public enum OpenDirection
	{
		TwoSide = 0,
		Forward = 1,
		Reversed = 2,
	}

	public Type type;
	public bool isOpened;
	public bool isLocked;
	public Transform doorLeft;
	public Transform doorRight;
	public GameObject doorTouchLeft;
	public GameObject doorTouchRight;
	public GameObject doorBlocker;
	public OcclusionPortal occlusionPortal;
	public EventTrigger openEvent;
	public EventTrigger closeEvent;
	public float openTime;
	public float closeTime;
	public Vector3 openedDoorParamLeft;
	public Vector3 openedDoorParamRight;
	public string openSound;
	public string closeSound;
	public OpenDirection openDirection;
	public DoorBehaviour[] linkedDoors;
	public bool silent;
	public bool isBusy;
	public bool openedDir;
	public SecurityGuardBehaviour CurrentOpenSecurityGuard;
	public bool IsAlreadyOpen;
}
