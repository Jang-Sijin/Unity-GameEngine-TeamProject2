using UnityEngine;

public class HauntedPotBehaviour : MonoBehaviour
{
	public enum State
	{
		Normal = 0,
		Polluted = 1,
		Broken = 2,
	}

	public State state;
	public HauntedPotBehaviour[] hauntedPots;
	public float visibleDistance;
	public GameObject brokenEffect;
	public GameObject selfLight;
	public GameObject normalObject;
	public GameObject pollutedObject;
	public GameObject brokenObject;
	public bool isDead;
}
