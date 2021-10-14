using System;
using UnityEngine;

[Serializable]
public class GOTranslationKey : GOKey
{
	public Vector3 _position;
	public int _interpolation;
	public bool _instant_invoke;
}
