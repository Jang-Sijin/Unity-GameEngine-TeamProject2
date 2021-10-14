using UnityEngine;
using UnityEngine.UI;

public class UIImageNumbers : MonoBehaviour
{
	public enum Align
	{
		Left = 0,
		Center = 1,
		Right = 2,
	}

	public int value;
	public Image[] imageNumbers;
	public string spriteName;
	public float space;
	public Align align;
}
