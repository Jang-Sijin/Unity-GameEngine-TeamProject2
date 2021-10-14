using UnityEngine;

public class CameraFilterPack_NightVisionFX : MonoBehaviour
{
	public enum preset
	{
		Night_Vision_Personalized = -1,
		Night_Vision_FX = 0,
		Night_Vision_Classic = 1,
		Night_Vision_Full = 2,
		Night_Vision_Dark = 3,
		Night_Vision_Sharp = 4,
		Night_Vision_BlueSky = 5,
		Night_Vision_Low_Light = 6,
		Night_Vision_Pinky = 7,
		Night_Vision_RedBurn = 8,
		Night_Vision_PurpleShadow = 9,
	}

	public Shader SCShader;
	public preset Preset;
	public float OnOff;
	public float Greenness;
	public float Vignette;
	public float Vignette_Alpha;
	public float Distortion;
	public float Noise;
	public float Intensity;
	public float Light;
	public float Light2;
	public float Line;
	public float Color_R;
	public float Color_G;
	public float Color_B;
	public float _Binocular_Size;
	public float _Binocular_Smooth;
	public float _Binocular_Dist;
}
