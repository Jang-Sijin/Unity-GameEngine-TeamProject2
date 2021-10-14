using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOEventAction : GOAction
{
	public Component _component;
	public bool _use_sendmessage;
	public List<GOEventParameter> _parameters;
	public string _method_name;
}
