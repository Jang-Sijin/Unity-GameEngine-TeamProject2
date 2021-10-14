using System;
using UnityEngine;

[Serializable]
public class Costume : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public CostumeData[] dataArray;
}
