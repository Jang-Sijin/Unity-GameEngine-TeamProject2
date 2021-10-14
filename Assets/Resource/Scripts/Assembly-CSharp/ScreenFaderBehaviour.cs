using UnityEngine;
using UnityEngine.UI;

public class ScreenFaderBehaviour : MonoBehaviour
{
	public enum State
	{
		None = 0,
		FadeIn = 1,
		FadeOut = 2,
	}

	public State state;
	public Image image;
	public float duration;
}
