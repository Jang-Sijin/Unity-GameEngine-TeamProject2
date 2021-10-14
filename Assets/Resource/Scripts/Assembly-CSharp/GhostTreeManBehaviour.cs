using UnityEngine;

public class GhostTreeManBehaviour : DynamicCharacterBehaviour
{
	public GameObject auraEffect;
	public string idleStateName;
	public string attackStateName;
	public string groggyStateName;
	public float attackableDistance;
	public Material[] originalMaterials;
	public Material[] groggyMaterials;
}
