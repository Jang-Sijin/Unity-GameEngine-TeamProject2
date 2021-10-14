using UnityEngine;
using UnityStandardAssets.ImageEffects;

public class PointCameraBehaviour : MonoBehaviour
{
	public new Transform transform;
	public Camera camera;
	public Light light;
	public CC_Levels levels;
	public CC_RadialBlur radialBlur;
	public CC_FastVignette vignette;
	public FXAA antialiasing;
	public DepthOfFieldDeprecated dof;
	public Bloom bloom;
	public MotionBlur motionBlur;
	public TouchPanelBehaviour touchPanel;
	public bool isVignetteEnable;
	public float dofCurDistance;
	public float dofSetDistance;
	public float dofDefaultDistance;
	public Vector3 reservedPosition;
	public Quaternion reservedRotation;
}
