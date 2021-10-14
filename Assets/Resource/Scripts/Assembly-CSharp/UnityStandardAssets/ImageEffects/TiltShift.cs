using UnityEngine;

namespace UnityStandardAssets.ImageEffects
{
	internal class TiltShift : PostEffectsBase
	{
		public enum TiltShiftMode
		{
			TiltShiftMode = 0,
			IrisMode = 1,
		}

		public enum TiltShiftQuality
		{
			Preview = 0,
			Low = 1,
			Normal = 2,
			High = 3,
		}

		public TiltShiftMode mode;
		public TiltShiftQuality quality;
		public float blurArea;
		public float maxBlurSize;
		public int downsample;
		public Shader tiltShiftShader;
	}
}
