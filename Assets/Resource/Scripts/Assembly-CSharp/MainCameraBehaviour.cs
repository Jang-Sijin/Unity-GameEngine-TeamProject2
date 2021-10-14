using UnityEngine;
using UnityStandardAssets.ImageEffects;

public class MainCameraBehaviour : MonoBehaviour
{
	public new Transform transform;
	public Camera camera;
	public Light light;
	public CC_Levels levels;
	public CC_RadialBlur radialBlur;
	public FXAA antialiasing;
	public Bloom bloom;
	public CameraFilterPack_AAA_WaterDrop distortion;
	public Transform attachNode;
	public Vector3 localRotation;
	public bool lockRotation;
}
