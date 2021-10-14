using System;
using UnityEngine;

[Serializable]
public class GOOrientationTrack : GOTrack
{
	public Transform _object;
	public GOTrack _cached_translation_track_start_target;
	public GOTrack _cached_translaton_track_end_target;
}
