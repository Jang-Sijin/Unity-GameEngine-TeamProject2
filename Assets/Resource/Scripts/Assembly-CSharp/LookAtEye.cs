using UnityEngine;
using System;

public class LookAtEye : MonoBehaviour
{
	[Serializable]
	public class LookAtEyeBone
	{
		public Transform transform;
		public Vector3 axis;
	}

	public bool isDebug;
	public Transform target;
	public LookAtEyeBone[] eyes;
	public float lookAtSpeed;
	public float clampDistanceEye;
	public float targetDistanceMin;
	public float targetDistanceMax;
	public float clampDistanceEyeMin;
	public float eyesWeight;
	public float clampWeightEyes;
	public int clampSmoothing;
	public Vector3[] ikPositions;
	public AnimationCurve spineWeightCurve;
	public bool isRunning;
}
