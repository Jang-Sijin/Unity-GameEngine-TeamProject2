using UnityEngine;

public class SubScenarioBuilder : MonoBehaviour
{
	public Transform[] subScenarioObjects;
	public Transform[] destroyObjects;
	public Transform[] dontDestroyObjects;
	public string[] destroyObjectNames;
	public string[] dontDestroyObjectNames;
	public DoorBehaviour[] lockDoors;
}
