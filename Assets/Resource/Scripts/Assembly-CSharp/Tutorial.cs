using System;
using UnityEngine;

[Serializable]
public class Tutorial : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public TutorialData[] dataArray;
}
