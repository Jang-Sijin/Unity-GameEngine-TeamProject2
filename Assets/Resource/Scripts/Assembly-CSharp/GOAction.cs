using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOAction : ScriptableObject
{
	public int _start_frame;
	public int _ease_type;
	public List<float> _custom_ease;
}
