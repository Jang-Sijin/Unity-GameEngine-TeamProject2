using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class ProFlareElement
{
	public enum Type
	{
		Single = 0,
		Multi = 1,
	}

	public bool Editing;
	public bool Visible;
	public int elementTextureID;
	public string SpriteName;
	public ProFlare flare;
	public ProFlareAtlas flareAtlas;
	public float Brightness;
	public float Scale;
	public float ScaleRandom;
	public float ScaleFinal;
	public Vector4 RandomColorAmount;
	public float position;
	public bool useRangeOffset;
	public float SubElementPositionRange_Min;
	public float SubElementPositionRange_Max;
	public float SubElementAngleRange_Min;
	public float SubElementAngleRange_Max;
	public Vector3 OffsetPosition;
	public Vector3 Anamorphic;
	public Vector3 OffsetPostion;
	public float angle;
	public float FinalAngle;
	public bool useRandomAngle;
	public bool useStarRotation;
	public float AngleRandom_Min;
	public float AngleRandom_Max;
	public bool OrientToSource;
	public bool rotateToFlare;
	public float rotationSpeed;
	public float rotationOverTime;
	public bool useColorRange;
	public Color ElementFinalColor;
	public Color ElementTint;
	public Color SubElementColor_Start;
	public Color SubElementColor_End;
	public bool useScaleCurve;
	public AnimationCurve ScaleCurve;
	public bool OverrideDynamicEdgeBoost;
	public float DynamicEdgeBoostOverride;
	public bool OverrideDynamicCenterBoost;
	public float DynamicCenterBoostOverride;
	public bool OverrideDynamicEdgeBrightness;
	public float DynamicEdgeBrightnessOverride;
	public bool OverrideDynamicCenterBrightness;
	public float DynamicCenterBrightnessOverride;
	public List<SubElement> subElements;
	public Vector2 size;
	public Type type;
}
