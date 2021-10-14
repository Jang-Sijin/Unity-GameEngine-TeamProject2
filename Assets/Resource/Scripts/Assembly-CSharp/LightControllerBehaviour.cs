using UnityEngine;

public class LightControllerBehaviour : MonoBehaviour
{
	public int includeParentLevel;
	public GameObject[] includeObjects;
	public GameObject[] excludeObjects;
	public Transform button;
	public GameObject lightEffect;
	public Color turnOnColor;
	public Color turnOffColor;
	public bool turnOffOnStart;
	public bool isFlicking;
	public float turnOnRotation;
	public string flickingSoundName;
	public string turnOnSoundName;
	public string turnOffSoundName;
}
