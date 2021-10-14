using System;
using UnityEngine;

[Serializable]
public class MailTimes : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public MailTimesData[] dataArray;
}
