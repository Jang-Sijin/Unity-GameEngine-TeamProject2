using UnityEngine;

public class ElectricRoomPuzzleBehaviour : MonoBehaviour
{
	public DragObjectBehaviour handle;
	public GameObject onLamp;
	public LightControllerBehaviour[] lights;
	public EventTrigger clearTriggers;
	public float handleMinHeight;
	public float handleMaxHeight;
}
