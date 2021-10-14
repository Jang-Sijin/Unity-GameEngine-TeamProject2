using System;
using UnityEngine;

[Serializable]
public class Items : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public ItemsData[] dataArray;
}
