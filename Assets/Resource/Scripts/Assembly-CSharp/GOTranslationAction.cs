using System;
using UnityEngine;

[Serializable]
public class GOTranslationAction : GOAction
{
	public int _end_frame;
	public int _frame;
	public Transform _obj;
	public Vector3[] path;
	public bool _instant_invoke;
}
