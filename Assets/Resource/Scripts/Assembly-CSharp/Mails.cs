using System;
using UnityEngine;

[Serializable]
public class Mails : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
	public MailsData[] dataArray;
}
