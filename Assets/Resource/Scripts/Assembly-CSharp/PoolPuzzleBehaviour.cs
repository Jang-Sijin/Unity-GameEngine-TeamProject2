using UnityEngine;
using System;

public class PoolPuzzleBehaviour : MonoBehaviour
{
	[Serializable]
	public struct PointCameraPosition
	{
		public PointCameraPosition(Vector3 s, Vector3 e) : this()
		{
		}

		public Vector3 start;
		public Vector3 end;
	}

	public GameObject ghostFaceFish;
	public EventTrigger failTrigger;
	public ParticleSystem fallEffect;
	public ParticleSystem waterEffect;
	public ParticleSystem hairEffect;
	public Transform swimmingNode;
	public Transform[] spawnNodes;
	public string ambienceSound;
	public string fallingSound;
	public string heartbeatSound;
	public string qteSuccessSound;
	public string qteFailSound;
	public GameObject water;
	public GameObject waterVisible;
	public PointCameraPosition[] pointCameraPositions;
	public int PointCameraPositionIndex;
	public bool isRandomPointCameraPosition;
}
