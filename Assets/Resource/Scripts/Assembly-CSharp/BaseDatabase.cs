using System;
using UnityEngine;

[Serializable]
public class BaseDatabase : ScriptableObject
{
	[SerializeField]
	public string sheetName;
	[SerializeField]
	public string worksheetName;
}
