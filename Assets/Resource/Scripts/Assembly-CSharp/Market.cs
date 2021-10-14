using System;
using UnityEngine;

[Serializable]
public class Market : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public MarketData[] dataArray;
}
