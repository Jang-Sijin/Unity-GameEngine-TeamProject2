using UnityEngine;

public class WayPointBehaviour : MonoBehaviour
{
	public int Floor;
	public int Index;
	public int StartWayPointIndex;
	public int EndWayPointIndex;
	public WayPointBehaviour nextWayPoint;
	public WayPointBehaviour preWayPoint;
	public ZoneTriggerBehaviour zoneTrigger;
	public DoorBehaviour door;
	public bool isWatchingZone;
	public bool isBranch;
	public float delayTimeAfterArrived;
}
