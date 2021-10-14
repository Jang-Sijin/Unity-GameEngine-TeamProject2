using UnityEngine;

public class WDStandaloneInputCheckup : MonoBehaviour
{
	public enum e_JoyPadState
	{
		None = 0,
		Xbox = 1,
		PS = 2,
	}

	public bool IsJoyPadState;
	public e_JoyPadState ConnectedState;
}
