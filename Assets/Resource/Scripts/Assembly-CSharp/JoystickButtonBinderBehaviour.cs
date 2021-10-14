using UnityEngine;

public class JoystickButtonBinderBehaviour : MonoBehaviour
{
	public enum InputType
	{
		Horizontal2 = 0,
		Vertical2 = 1,
		Run = 2,
		Hide = 3,
		Lighter = 4,
		Select = 5,
		Cancel = 6,
		Inventory = 7,
		MAX = 8,
	}

	public InputType inputType;
}
