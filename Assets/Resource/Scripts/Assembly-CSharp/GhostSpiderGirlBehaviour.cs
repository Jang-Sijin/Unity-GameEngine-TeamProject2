using UnityEngine;

public class GhostSpiderGirlBehaviour : MonoBehaviour
{
	public GameObject meshPrefab;
	public SpiderGirlRegion[] classRooms;
	public LightControllerBehaviour[] lightController;
	public float ceilingHeight;
	public float speed;
	public float attackableDistance;
	public string idleStateName;
	public string moveStateName;
	public string attackStateName;
	public EventTrigger encounterTrigger;
}
