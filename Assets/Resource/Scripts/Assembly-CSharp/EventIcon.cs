using System;
using UnityEngine;

[Serializable]
public class EventIcon : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public EventIconData[] dataArray;
}
