using UnityEngine;

public class CameraFilterPack_Blend2Camera_PhotoshopFilters : MonoBehaviour
{
	public enum filters
	{
		Darken = 0,
		Multiply = 1,
		ColorBurn = 2,
		LinearBurn = 3,
		DarkerColor = 4,
		Lighten = 5,
		Screen = 6,
		ColorDodge = 7,
		LinearDodge = 8,
		LighterColor = 9,
		Overlay = 10,
		SoftLight = 11,
		HardLight = 12,
		VividLight = 13,
		LinearLight = 14,
		PinLight = 15,
		HardMix = 16,
		Difference = 17,
		Exclusion = 18,
		Subtract = 19,
		Divide = 20,
		Hue = 21,
		Saturation = 22,
		Color = 23,
		Luminosity = 24,
	}

	public Shader SCShader;
	public Camera Camera2;
	public filters filterchoice;
	public float SwitchCameraToCamera2;
	public float BlendFX;
}
