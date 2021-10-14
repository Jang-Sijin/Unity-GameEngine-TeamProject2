using UnityEngine;

public class LevelInfoStorageBehaviour : MonoBehaviour
{
	public enum Priority
	{
		High = 0,
		Normal = 1,
		Low = 2,
		Max = 3,
	}

	public string id;
	public byte[] hash;
	public Priority priority;
	public bool saveActive;
	public bool savePosition;
	public bool saveRotation;
	public bool saveExtraData;
	public bool seperatelyMap;
}
