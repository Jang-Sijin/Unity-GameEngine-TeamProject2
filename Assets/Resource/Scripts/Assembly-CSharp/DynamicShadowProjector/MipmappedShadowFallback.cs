using UnityEngine;

namespace DynamicShadowProjector
{
	public class MipmappedShadowFallback : MonoBehaviour
	{
		public Object m_fallbackShaderOrMaterial;
		public int m_blurLevel;
		public float m_blurSize;
		public bool m_modifyTextureSize;
		public ShadowTextureRenderer.TextureMultiSample m_multiSampling;
		public ShadowTextureRenderer.TextureSuperSample m_superSampling;
		public int m_textureWidth;
		public int m_textureHeight;
		public Shader m_tex2DlodCheckShader;
		public Shader m_glslCheckShader;
	}
}
