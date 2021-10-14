using UnityEngine;
using UnityEngine.UI;

public class GraphicStateTransition : MonoBehaviour
{
	[SerializeField]
	private Graphic[] m_graphics;
	public Selectable.Transition transition;
	public ColorBlock colors;
}
