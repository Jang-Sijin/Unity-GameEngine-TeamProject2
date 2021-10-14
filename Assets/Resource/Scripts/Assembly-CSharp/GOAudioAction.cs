using System;
using UnityEngine;

[Serializable]
public class GOAudioAction : GOAction
{
	public AudioClip _audio_clip;
	public int _audio_id;
	public int _audio_channel;
	public int _caption_id;
	public bool _loop;
}
