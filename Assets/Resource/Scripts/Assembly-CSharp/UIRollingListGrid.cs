using UnityEngine;
using UnityEngine.UI;

public class UIRollingListGrid : MonoBehaviour
{
	[SerializeField]
	protected GridLayoutGroup.Axis m_StartAxis;
	[SerializeField]
	protected Vector2 m_CellSize;
	[SerializeField]
	protected Vector2 m_Spacing;
}
