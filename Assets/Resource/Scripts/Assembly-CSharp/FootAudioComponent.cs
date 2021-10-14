using UnityEngine;
using System;
using Audio;

public class FootAudioComponent : MonoBehaviour
{
	[Serializable]
	public struct FootAudioCue
	{
		public FootAudioType footAudioType;
		public AudioCue audioCue;
	}

	public bool IsTest;
	public FootAudioType TestFootType;
	public FootAudioCue[] footAudioCueArray;
}
