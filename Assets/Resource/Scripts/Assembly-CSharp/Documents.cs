using System;
using UnityEngine;

[Serializable]
public class Documents : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public DocumentsData[] dataArray;
}
