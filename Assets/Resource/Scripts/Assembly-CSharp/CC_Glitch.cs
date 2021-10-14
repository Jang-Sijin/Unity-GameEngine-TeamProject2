using System;

public class CC_Glitch : CC_Base
{
	[Serializable]
	public class InterferenceSettings
	{
		public float speed;
		public float density;
		public float maxDisplacement;
	}

	[Serializable]
	public class TearingSettings
	{
		public float speed;
		public float intensity;
		public float maxDisplacement;
		public bool allowFlipping;
		public bool yuvColorBleeding;
		public float yuvOffset;
	}

	public enum Mode
	{
		Interferences = 0,
		Tearing = 1,
		Complete = 2,
	}

	public Mode mode;
	public InterferenceSettings interferencesSettings;
	public TearingSettings tearingSettings;
}
