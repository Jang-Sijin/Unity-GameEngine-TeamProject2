using UnityEngine;

public class UIStringSetter : MonoBehaviour
{
	public enum StringType
	{
		Default = 0,
		Global = 1,
	}

	public StringType type;
	public string ID;
	public string preFixStr;
	public string postFixStr;
}
