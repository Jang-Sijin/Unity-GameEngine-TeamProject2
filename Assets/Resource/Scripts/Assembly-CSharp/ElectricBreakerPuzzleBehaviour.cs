using UnityEngine;

public class ElectricBreakerPuzzleBehaviour : MonoBehaviour
{
	public GameObject[] onSwitches;
	public GameObject[] handles;
	public GameObject[] fuses;
	public Transform pickupFuseTransform;
	public EventTrigger[] onTriggers;
	public EventTrigger[] offTriggers;
	public string fuseOutSoundName;
	public string fuseInSoundName;
	public float handleMinHeight;
	public float handleMaxHeight;
}
