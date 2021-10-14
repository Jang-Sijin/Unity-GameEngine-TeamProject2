using UnityEngine;
using System;
using System.Collections.Generic;

public class AudioClipPool : MonoBehaviour
{
	[Serializable]
	private struct AudioClipReference
	{
		public int index;
		public AudioClip audioClip;
		public int referenceCount;
		public long releaseTime;
	}

	[SerializeField]
	private List<AudioClipPool.AudioClipReference> mAudioClips;
	[SerializeField]
	private double mReleaseTimeSeconds;
}
