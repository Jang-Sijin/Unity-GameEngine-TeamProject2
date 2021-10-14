using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOEventKey : GOKey
{
	public Component _component;
	public bool _use_sendmessage;
	public List<GOEventParameter> _parameters;
	public string _method_name;
	public int _method_index;
}
