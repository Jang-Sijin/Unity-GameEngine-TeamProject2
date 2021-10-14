using UnityEngine;

public class CharacterLightBehaviour : MonoBehaviour
{
	public bool useLightProbe;
	public bool isCharacter;
	public float lightRangeOnCinema;
	public LayerMask charCullingMask;
	public GameObject shadow;
	public Transform shadowTarget;
}
