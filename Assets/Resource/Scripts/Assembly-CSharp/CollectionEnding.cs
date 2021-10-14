using System;
using UnityEngine;

[Serializable]
public class CollectionEnding : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public CollectionEndingData[] dataArray;
}
