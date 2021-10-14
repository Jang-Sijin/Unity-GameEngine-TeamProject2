using System;
using UnityEngine;

[Serializable]
public class Dialog_Sound : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public Dialog_SoundData[] dataArray;
}
