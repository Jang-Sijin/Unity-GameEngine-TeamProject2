using UnityEngine;

public class GhostMirroredManPuzzleBehaviour : MonoBehaviour
{
	public GameObject[] speakers;
	public GameObject[] invertedSpeakers;
	public GameObject[] speakerSlots;
	public GameObject[] invertedSpeakerSlots;
	public EventTrigger[] clearTriggers;
	public EventTrigger timeoutTrigger;
	public int maxWave;
}
