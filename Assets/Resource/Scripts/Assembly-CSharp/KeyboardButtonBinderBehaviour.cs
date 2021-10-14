using UnityEngine;

public class KeyboardButtonBinderBehaviour : MonoBehaviour
{
	public enum InputType
	{
		Left = 0,
		Right = 1,
		Forward = 2,
		Backward = 3,
		Run = 4,
		Hide = 5,
		Lighter = 6,
		MAX = 7,
	}

	public InputType inputType;
}
