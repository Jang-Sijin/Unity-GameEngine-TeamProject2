using UnityEngine;
using System;

namespace DynamicShadowProjector
{
	public class DrawTargetObject : MonoBehaviour
	{
		[Serializable]
		public struct ReplaceShader
		{
			public string renderType;
			public Shader shader;
		}

		public enum TextureAlignment
		{
			None = 0,
			TargetAxisX = 1,
			TargetAxisY = 2,
			TargetAxisZ = 3,
		}

		public enum UpdateFunction
		{
			OnPreCull = 0,
			LateUpdate = 1,
			UpdateTransform = 2,
		}

		[SerializeField]
		private Transform m_target;
		[SerializeField]
		private LayerMask m_layerMask;
		[SerializeField]
		private TextureAlignment m_textureAlignment;
		[SerializeField]
		private UpdateFunction m_updateFunction;
		[SerializeField]
		private Material m_shadowShader;
		[SerializeField]
		private ReplaceShader[] m_replacementShaders;
		[SerializeField]
		private bool m_renderChildren;
		[SerializeField]
		private bool m_followTarget;
	}
}
