using UnityEngine;
using System.Collections.Generic;

public class ProFlareBatch : MonoBehaviour
{
	public enum Mode
	{
		Standard = 0,
		SingleCamera = 1,
		VR = 2,
	}

	public bool debugMessages;
	public Mode mode;
	public ProFlareAtlas _atlas;
	public List<FlareData> FlaresList;
	public List<ProFlareElement> FlareElements;
	public ProFlareElement[] FlareElementsArray;
	public Camera GameCamera;
	public Transform GameCameraTrans;
	public Camera FlareCamera;
	public Transform FlareCameraTrans;
	public MeshFilter meshFilter;
	public Transform thisTransform;
	public MeshRenderer meshRender;
	public float zPos;
	public Material mat;
	public FlareOcclusion[] FlareOcclusionData;
	public bool useBrightnessThreshold;
	public int BrightnessThreshold;
	public bool overdrawDebug;
	public bool dirty;
	public bool useCulling;
	public int cullFlaresAfterTime;
	public int cullFlaresAfterCount;
	public bool culledFlaresNowVisiable;
	public float reshowCulledFlaresAfter;
	public Transform helperTransform;
	public bool showAllConnectedFlares;
	public bool VR_Mode;
	public float VR_Depth;
	public bool SingleCamera_Mode;
}
