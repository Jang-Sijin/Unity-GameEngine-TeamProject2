using UnityEngine;

public class GhostGiantEunMiPuzzleSafetyzoneBehaviour : MonoBehaviour
{
	public enum SafetyType
	{
		Normal = 0,
		Perfect = 1,
		Safe = 2,
		Danger = 3,
	}

	public GhostGiantEunMiPuzzleBehaviour puzzle;
	public GiantEunMiGhostBehaviour EunMiBehaviour;
	public int TriggerIndex;
	public SafetyType safetyType;
}
