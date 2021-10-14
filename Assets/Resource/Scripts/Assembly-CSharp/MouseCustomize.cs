using UnityEngine;

public class MouseCustomize : MonoBehaviour
{
	public enum IconType
	{
		Arrow = 0,
		Hand = 1,
		Grip = 2,
		Eye = 3,
		DialGrip = 4,
		Max = 5,
	}

	public Vector3 mousePosition;
	public int moveSpeed;
	public bool m_Visible;
	public IconType Icon;
	public Vector3 DragPos;
}
