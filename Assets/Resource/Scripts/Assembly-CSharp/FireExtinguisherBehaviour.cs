using UnityEngine;

public class FireExtinguisherBehaviour : MonoBehaviour
{
	public Transform extinguisher;
	public ParticleSystem sprayEffect;
	public ParticleSystem fireEffect;
	public EventTrigger startTrigger;
	public EventTrigger clearTrigger;
	public string spraySound;
	public Vector3 extinguisherPosition;
	public Vector3 extinguisherRotation;
}
