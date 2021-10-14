using System;
using UnityEngine;

[Serializable]
public class CollectionRank : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public CollectionRankData[] dataArray;
}
