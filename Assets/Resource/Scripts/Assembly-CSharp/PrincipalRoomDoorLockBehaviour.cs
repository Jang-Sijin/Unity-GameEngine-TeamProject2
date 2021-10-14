using UnityEngine;

public class PrincipalRoomDoorLockBehaviour : MonoBehaviour
{
	public int[] passwords;
	public GameObject[] digits;
	public EventTrigger clearTrigger;
	public string tickSound;
	public string invalidPasswordSound;
}
