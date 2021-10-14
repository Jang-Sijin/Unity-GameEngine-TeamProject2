using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOGroup : ScriptableObject
{
	public string _group_name;
	public int _group_id;
	public List<int> _elements;
	public bool _foldout;
}
