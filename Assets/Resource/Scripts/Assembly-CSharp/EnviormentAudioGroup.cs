using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class EnviormentAudioGroup
{
	public EnviormentAudioOutput audioOutput;
	public float fadeTime;
	public bool use;
	public float delay;
	public float maxVolume;
	public List<AudioClip> audioClipList;
	public AudioSource audioSourceCache;
}
