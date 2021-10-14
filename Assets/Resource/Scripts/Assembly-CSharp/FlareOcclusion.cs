using System;

[Serializable]
public class FlareOcclusion
{
	public enum CullingState
	{
		Visible = 0,
		CullCountDown = 1,
		CanCull = 2,
		Culled = 3,
		NeverCull = 4,
	}

	public bool occluded;
	public float occlusionScale;
	public CullingState _CullingState;
	public float CullTimer;
	public float cullFader;
}
