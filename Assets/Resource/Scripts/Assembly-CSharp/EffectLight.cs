using UnityEngine;

public class EffectLight : MonoBehaviour
{
	public float duration;
	public bool looping;
	public float delay;
	public float lifetime;
	public AnimationCurve intensityOverLifetime;
	public Gradient colorOverLifetime;
}
