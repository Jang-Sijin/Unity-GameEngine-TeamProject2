using UnityEngine;

public class CharacterBehaviour : MonoBehaviour
{
	public AccountManager.Character character;
	public GameObject meshPrefab;
	public FootAudioComponent footAudioComponent;
	public float walkSpeed;
	public float runSpeed;
	public GameObject doorOpener;
	public ZoneTriggerBehaviour zoneTrigger;
	public bool skip_update_animation;
}
