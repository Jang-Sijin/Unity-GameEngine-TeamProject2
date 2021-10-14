using UnityEngine;
using System.Collections.Generic;

public class ProFlare : MonoBehaviour
{
	public ProFlareAtlas _Atlas;
	public ProFlareBatch[] FlareBatches;
	public bool EditingAtlas;
	public bool isVisible;
	public List<ProFlareElement> Elements;
	public Transform thisTransform;
	public Vector3 LensPosition;
	public bool EditGlobals;
	public float GlobalScale;
	public bool MultiplyScaleByTransformScale;
	public float GlobalBrightness;
	public Color GlobalTintColor;
	public bool useMaxDistance;
	public bool useDistanceScale;
	public bool useDistanceFade;
	public float GlobalMaxDistance;
	public bool UseAngleLimit;
	public float maxAngle;
	public bool UseAngleScale;
	public bool UseAngleBrightness;
	public bool UseAngleCurve;
	public AnimationCurve AngleCurve;
	public LayerMask mask;
	public bool RaycastPhysics;
	public bool Occluded;
	public float OccludeScale;
	public float OffScreenFadeDist;
	public bool useDynamicEdgeBoost;
	public float DynamicEdgeBoost;
	public float DynamicEdgeBrightness;
	public float DynamicEdgeRange;
	public float DynamicEdgeBias;
	public AnimationCurve DynamicEdgeCurve;
	public bool useDynamicCenterBoost;
	public float DynamicCenterBoost;
	public float DynamicCenterBrightness;
	public float DynamicCenterRange;
	public float DynamicCenterBias;
	public bool neverCull;
	public bool DisabledPlayMode;
}
