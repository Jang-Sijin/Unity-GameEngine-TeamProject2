using UnityEngine;

namespace DynamicShadowProjector
{
	public class DrawSceneObject : MonoBehaviour
	{
		[SerializeField]
		private Shader m_replacementShader;
		[SerializeField]
		private LayerMask m_cullingMask;
	}
}
