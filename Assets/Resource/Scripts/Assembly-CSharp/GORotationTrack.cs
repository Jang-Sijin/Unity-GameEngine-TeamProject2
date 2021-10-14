using System;
using UnityEngine;

[Serializable]
public class GORotationTrack : GOTrack
{
	[SerializeField]
	private Transform _obj;
	public Quaternion _cached_init_rotation;
}
