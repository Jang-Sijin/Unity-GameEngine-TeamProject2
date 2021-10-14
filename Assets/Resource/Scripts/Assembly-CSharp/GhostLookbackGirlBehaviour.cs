using UnityEngine;

public class GhostLookbackGirlBehaviour : MonoBehaviour
{
	public GameObject meshPrefab;
	public Transform[] spawnPoints;
	public string[] scripts;
	public float[] scriptTimes;
	public LightControllerBehaviour lightController;
	public TalismanTaegeukBehaviour talismanTaegeuk;
	public LightSmoothIntensityBehaviour hitLight;
	public Material dissolveMaterial;
	public EventTrigger clearTrigger;
	public ParticleSystem burnEffect;
	public ParticleSystem disappearEffect;
	public string ambientSound;
	public string appearSound;
	public string attackSound;
	public string countEndSound;
	public string disappearSound;
	public string painSoundName;
	public string dieSoundName;
}
