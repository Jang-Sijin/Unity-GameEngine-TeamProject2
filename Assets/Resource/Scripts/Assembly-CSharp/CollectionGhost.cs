using System;
using UnityEngine;

[Serializable]
public class CollectionGhost : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public CollectionGhostData[] dataArray;
}
