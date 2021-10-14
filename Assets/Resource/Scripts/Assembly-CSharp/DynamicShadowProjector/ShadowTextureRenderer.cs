using UnityEngine;

namespace DynamicShadowProjector
{
	public class ShadowTextureRenderer : MonoBehaviour
	{
		public enum TextureMultiSample
		{
			x1 = 1,
			x2 = 2,
			x4 = 4,
			x8 = 8,
		}

		public enum TextureSuperSample
		{
			x1 = 1,
			x4 = 2,
			x16 = 4,
		}

		public enum MipmapFalloff
		{
			None = 0,
			Linear = 1,
			Custom = 2,
		}

		public enum BlurFilter
		{
			Uniform = 0,
			Gaussian = 1,
		}

		[SerializeField]
		private TextureMultiSample m_multiSampling;
		[SerializeField]
		private TextureSuperSample m_superSampling;
		[SerializeField]
		private MipmapFalloff m_mipmapFalloff;
		[SerializeField]
		private BlurFilter m_blurFilter;
		[SerializeField]
		private bool m_testViewClip;
		[SerializeField]
		private int m_textureWidth;
		[SerializeField]
		private int m_textureHeight;
		[SerializeField]
		private int m_mipLevel;
		[SerializeField]
		private int m_blurLevel;
		[SerializeField]
		private float m_blurSize;
		[SerializeField]
		private float m_mipmapBlurSize;
		[SerializeField]
		private bool m_singlePassMipmapBlur;
		[SerializeField]
		private Color m_shadowColor;
		[SerializeField]
		private Material m_blurShader;
		[SerializeField]
		private Material m_downsampleShader;
		[SerializeField]
		private Material m_copyMipmapShader;
		[SerializeField]
		private Material m_eraseShadowShader;
		[SerializeField]
		private float[] m_customMipmapFalloff;
		[SerializeField]
		private RenderTextureFormat[] m_preferredTextureFormats;
		[SerializeField]
		private Camera[] m_camerasForViewClipTest;
		[SerializeField]
		private Camera m_camera;
	}
}
