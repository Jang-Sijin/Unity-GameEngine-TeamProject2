using System;
using UnityEngine;

[Serializable]
public class Dialog_Caption : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public Dialog_CaptionData[] dataArray;
}
