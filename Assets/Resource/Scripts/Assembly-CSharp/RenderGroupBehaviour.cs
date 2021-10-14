using UnityEngine;

public class RenderGroupBehaviour : MonoBehaviour
{
	public bool ignoreRenderGroup;
	public RenderGroupBounds[] bounds;
	public GameObject[] includedObjects;
	public GameObject[] excludedObjects;
}
