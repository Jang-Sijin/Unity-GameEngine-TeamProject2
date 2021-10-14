using UnityEngine;

public class PrincipalDeskBehaviour : MonoBehaviour
{
	public GameObject drawer;
	public float drawerOpenPositionZ;
	public GameObject[] tiles;
	public Vector3[] tileDirections;
	public EventTrigger drawerOpenTrigger;
	public EventTrigger tileMatchTrigger;
}
