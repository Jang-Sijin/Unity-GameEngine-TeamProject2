using System;
using UnityEngine;

[Serializable]
public class DefaultStrings : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public DefaultStringsData[] dataArray;
}
