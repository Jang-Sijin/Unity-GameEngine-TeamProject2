using UnityEngine;

public class CameraFilterPack_Colors_Adjust_PreFilters : MonoBehaviour
{
	public enum filters
	{
		Normal = 0,
		BlueLagoon = 1,
		BlueMoon = 2,
		RedWhite = 3,
		NashVille = 4,
		VintageYellow = 5,
		GoldenPink = 6,
		DarkPink = 7,
		PopRocket = 8,
		RedSoftLight = 9,
		YellowSunSet = 10,
		Walden = 11,
		WhiteShine = 12,
		Fluo = 13,
		MarsSunRise = 14,
		Amelie = 15,
		BlueJeans = 16,
		NightVision = 17,
		BlueParadise = 18,
		Blindness_Deuteranomaly = 19,
		Blindness_Protanopia = 20,
		Blindness_Protanomaly = 21,
		Blindness_Deuteranopia = 22,
		Blindness_Tritanomaly = 23,
		Blindness_Achromatopsia = 24,
		Blindness_Achromatomaly = 25,
		Blindness_Tritanopia = 26,
		BlackAndWhite_Blue = 27,
		BlackAndWhite_Green = 28,
		BlackAndWhite_Orange = 29,
		BlackAndWhite_Red = 30,
		BlackAndWhite_Yellow = 31,
	}

	public Shader SCShader;
	public filters filterchoice;
	public float FadeFX;
}
