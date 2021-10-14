using System;
using UnityEngine;

[Serializable]
public class Vibration : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public Vibrationdata[] dataArray;
}
