using UnityEngine;

public class GhostTreeManGroggy : MonoBehaviour
{
	public GhostTreeManBehaviour ghostTreeman;
	[SerializeField]
	private SkinnedMeshRenderer[] m_Renderers;
	public Light frontLight;
	public Light backLight;
	public TreeManGroggyLightSetting frontDefaultLightSetting;
	public TreeManGroggyLightSetting backDefaultLightSetting;
	public TreeManGroggyLightSetting frontGroggyLightSetting;
	public TreeManGroggyLightSetting backGroggyLightSetting;
	public float tweenDuration;
	public SkinnedMeshRenderer propTreeMan;
	public Material originalMaterial;
	public Material groggyMaterial;
}
