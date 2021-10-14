using UnityEngine;

public class CinemaDissolve : MonoBehaviour
{
	public SkinnedMeshRenderer[] SkinedMeshRenderers;
	public Material[] OriginalMaterials;
	public Material[] DissolveMaterials;
	public GameObject[] disableObjects;
	public float DissovlveSpeed;
	public HairTransparentRenderer transRenderer;
}
