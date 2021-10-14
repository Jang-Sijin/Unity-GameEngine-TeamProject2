using UnityEngine;

public class KeyCollatorBehaviour : MonoBehaviour
{
	public GameObject[] unboundKeys;
	public GameObject[] boundKeys;
	public GameObject[] unboundKeyPrefabs;
	public GameObject[] boundKeyPrefabs;
	public DynamicMeshBehaviour leftKeySlot;
	public DynamicMeshBehaviour rightKeySlot;
	public EventTrigger runMachineTrigger;
	public EventTrigger stopMachineTrigger;
	public EventTrigger putOnLeftKeyTrigger;
	public EventTrigger putOnRightKeyTrigger;
	public EventTrigger putDownLeftKeyTrigger;
	public EventTrigger putDownRightKeyTrigger;
}
