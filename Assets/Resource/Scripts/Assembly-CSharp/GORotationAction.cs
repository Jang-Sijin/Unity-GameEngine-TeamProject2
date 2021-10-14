using System;
using UnityEngine;

[Serializable]
public class GORotationAction : GOAction
{
	public int _end_frame;
	public Transform _obj;
	public Quaternion _start_rotation;
	public Quaternion _end_rotation;
	public bool _instant_invoke;
}
