using System;
using UnityEngine;

[Serializable]
public class GOOrientationAction : GOAction
{
	public int _end_frame;
	public Transform _object;
	public Transform _start_target;
	public Transform _end_target;
	public bool _is_set_start_position;
	public bool _is_set_end_position;
	public Vector3 _start_position;
	public Vector3 _end_position;
}
