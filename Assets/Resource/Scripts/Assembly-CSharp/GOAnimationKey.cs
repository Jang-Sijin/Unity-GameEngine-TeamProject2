using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOAnimationKey : GOKey
{
	public WrapMode _wrap_mode;
	public string _ani_name;
	public string _take_name;
	public AnimationClip _ani_clip;
	public bool _cross_fade;
	public float _cross_fade_time;
	public Quaternion _rotation;
	public List<string> _animation_names;
}
