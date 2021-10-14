using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOKey : ScriptableObject
{
	public int _frame;
	public int _ease_type;
	public List<float> _custom_ease;
}
