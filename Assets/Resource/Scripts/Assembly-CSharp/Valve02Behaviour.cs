using UnityEngine;

public class Valve02Behaviour : MonoBehaviour
{
	public enum RotationDir
	{
		CW = 0,
		CCW = 1,
	}

	public RotationDir rotationDir;
	public EventTrigger clearTrigger;
	public float rotation;
}
