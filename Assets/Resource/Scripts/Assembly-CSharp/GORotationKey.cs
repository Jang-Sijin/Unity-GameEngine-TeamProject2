using System;
using UnityEngine;

[Serializable]
public class GORotationKey : GOKey
{
	public Quaternion _rotation;
	public bool _instant_invoke;
}
