using System;
using UnityEngine;

[Serializable]
public class GOAnimationAction : GOAction
{
	public AnimationClip _ani_clip;
	public WrapMode _wrap_mode;
	public GameObject _object;
	public string _anim_name;
	public bool _cross_fade;
	public float _cross_fade_time;
	public Quaternion _rotation;
}
