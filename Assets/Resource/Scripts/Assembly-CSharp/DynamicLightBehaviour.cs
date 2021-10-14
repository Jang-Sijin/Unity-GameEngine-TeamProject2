using UnityEngine;

public class DynamicLightBehaviour : MonoBehaviour
{
	public new Transform transform;
	public Light light;
	public bool ignoreFloor;
	public bool ignoreRaycasting;
	public LightControllerBehaviour lightController;
}
