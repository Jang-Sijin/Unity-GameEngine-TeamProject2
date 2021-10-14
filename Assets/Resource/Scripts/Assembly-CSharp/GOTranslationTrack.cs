using System;
using UnityEngine;

[Serializable]
public class GOTranslationTrack : GOTrack
{
	[SerializeField]
	private Transform _obj;
	public Vector3 _cached_initial_position;
}
