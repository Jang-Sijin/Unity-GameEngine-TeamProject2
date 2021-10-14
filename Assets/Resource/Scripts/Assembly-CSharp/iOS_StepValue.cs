using System;
using UnityEngine;

[Serializable]
public class iOS_StepValue : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public iOS_StepValueData[] dataArray;
}
