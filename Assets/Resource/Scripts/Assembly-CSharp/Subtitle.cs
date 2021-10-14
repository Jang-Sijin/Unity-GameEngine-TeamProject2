using System;
using UnityEngine;

[Serializable]
public class Subtitle : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public SubtitleData[] dataArray;
}
