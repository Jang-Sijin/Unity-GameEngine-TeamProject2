using System;
using UnityEngine;

[Serializable]
public class EventNode
{
	public string id;
	public string[] nextNode;
	public Vector2 pos;
	public bool isRunning;
	public bool enabled;
	public string description;
	public EventNodeType nodeType;
	public EventTargetObjectType targetObjectType;
	public int intParam1;
	public int intParam2;
	public bool boolParam;
	public bool boolParam2;
	public float floatParam;
	public string stringParam1;
	public string stringParam2;
	public Vector3 vector3Param;
	public GameObject objectParam;
}
