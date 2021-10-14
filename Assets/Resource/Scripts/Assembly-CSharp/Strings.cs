using System;
using UnityEngine;

[Serializable]
public class Strings : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public StringsData[] dataArray;
}
