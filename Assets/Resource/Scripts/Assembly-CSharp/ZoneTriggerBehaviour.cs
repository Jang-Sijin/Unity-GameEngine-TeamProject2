using UnityEngine;

public class ZoneTriggerBehaviour : MonoBehaviour
{
	public enum ZoneMaterial
	{
		Default = 0,
		Wood = 1,
		Stone = 2,
		Tiled = 3,
		Carpet = 4,
		Vent = 5,
		Water = 6,
	}

	public ZoneType zone;
	public bool isOpenSpace;
	public LightControllerBehaviour lightController;
	public WayPointBehaviour[] wayPoints;
	public ZoneMaterial zoneMaterial;
	public bool enableFogLgtOn;
	public float fogStartDistanceLgtOn;
	public float fogEndDistanceLgtOn;
	public bool enableFogLgtOff;
	public float fogStartDistanceLgtOff;
	public float fogEndDistanceLgtOff;
	public Color fogColor;
	public GameObject[] syncVisibleObjects;
}
