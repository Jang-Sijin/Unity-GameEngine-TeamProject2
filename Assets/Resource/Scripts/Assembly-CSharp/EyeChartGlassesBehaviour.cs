using UnityEngine;

public class EyeChartGlassesBehaviour : MonoBehaviour
{
	public Camera renderCamera;
	public Material renderMaterial;
	public MeshFilter leftLens;
	public MeshFilter rightLens;
	public float lensScale;
	public Vector2 leftLensOffset;
	public Vector2 rightLensOffset;
	public Vector3 viewPointOffset;
}
