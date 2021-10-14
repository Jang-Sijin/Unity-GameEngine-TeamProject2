using System;
using UnityEngine;

[Serializable]
public class Dialog_Selection : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public Dialog_SelectionData[] dataArray;
}
