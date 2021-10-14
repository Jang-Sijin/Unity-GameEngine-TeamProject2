using System;
using UnityEngine;

[Serializable]
public class LightFlicker : MonoBehaviour
{
	public float amount;
	public float speed;
	public bool adjustLocation;
	public float locationAdjustAmount;
	public bool adjustScale;
	public float scaleAdjustAmount;
	public Transform scaleObject;
}
