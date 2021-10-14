using UnityEngine;

public class GhostHouseMotherBehaviour : MonoBehaviour
{
	public GameObject houseMotherPrefab;
	public Vector3 spawnPosition1;
	public Vector3 spawnRotation1;
	public Vector3 positionReaction3;
	public Vector3 rotationReaction3;
	public DoorBehaviour door1;
	public DoorBehaviour door2;
	public string reaction;
	public EventTrigger clearTrigger;
	public EventTrigger readyLastReactionTrigger;
	public EventTrigger lastReactionTrigger;
	public Transform reactionLookAt;
	public float dissolveSpeed;
}
