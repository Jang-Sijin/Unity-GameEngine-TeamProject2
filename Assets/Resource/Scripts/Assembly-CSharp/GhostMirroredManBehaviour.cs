using UnityEngine;

public class GhostMirroredManBehaviour : AICharacterBehaviour
{
	public Region movableRegion;
	public string[] attackStatename;
	public Transform nodeRightHand;
	public ProjectileBehaviour projectilePrefab;
	public TrapBehaviour minePrefab;
	public GameObject catchTrapPrefab;
	public Rigidbody[] speakers;
	public Material damagedMaterial;
	public string castSoundName;
}
