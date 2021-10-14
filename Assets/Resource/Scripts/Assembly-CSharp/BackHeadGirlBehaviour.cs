using UnityEngine;

public class BackHeadGirlBehaviour : AICharacterBehaviour
{
	public string standbyStateName;
	public string attackStateName;
	public GameObject damageEffect;
	public GameObject[] spawnPoints;
	public EventTrigger endBattleTrigger;
}
