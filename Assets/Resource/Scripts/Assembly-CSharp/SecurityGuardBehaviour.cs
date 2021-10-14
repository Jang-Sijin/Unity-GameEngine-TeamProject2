using UnityEngine;

public class SecurityGuardBehaviour : AISecureGuard
{
	public string attackStateName;
	public float attackableDistance;
	public string whistleSoundName;
	public float ambushRadius;
	public bool ActiveToiletSearch;
	public bool ActiveToiletAttack;
	public bool isNear;
	public DoorBehaviour RestRoomDoorController;
	public float MinAcceleration;
	public float MinSpeed;
	public BoxCollider CrouchAnimationCollide;
	public GameObject IndicatorNext;
}
