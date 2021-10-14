using System;
using UnityEngine;

[Serializable]
public class TileAnimation : MonoBehaviour
{
	public int xFrames;
	public int yFrames;
	public float speed;
	public bool billboard;
	public Camera mainCamera;
}
