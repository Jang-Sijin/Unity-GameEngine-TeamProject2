using UnityEngine;

public class LostChildrenPuzzleBehaviour : MonoBehaviour
{
	public LostChildrenPuzzlePasswordBehaviour password;
	public Transform[] photos;
	public Transform[] positions;
	public EventTrigger clearTrigger;
	public string detachSound;
	public string moveSound;
}
