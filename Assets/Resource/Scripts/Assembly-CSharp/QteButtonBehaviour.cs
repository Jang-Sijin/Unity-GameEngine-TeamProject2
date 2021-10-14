using UnityEngine;

public class QteButtonBehaviour : MonoBehaviour
{
	public int maxClickCount;
	public float limitTime;
	public EventTrigger successTrigger;
	public EventTrigger failedTrigger;
	public Transform targetObject;
	public Vector3 moveToTouch;
}
