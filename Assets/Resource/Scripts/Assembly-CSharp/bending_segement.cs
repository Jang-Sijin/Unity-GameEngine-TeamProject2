using System;
using UnityEngine;

[Serializable]
public class bending_segement
{
	public Transform _start_transform;
	public Transform _end_transform;
	public float _threshold_angle_difference;
	public float _bending_multiplier;
	public float _max_angle_difference;
	public float _max_bending_angle;
	public float _responsiveness;
}
