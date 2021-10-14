using System;
using UnityEngine;

[Serializable]
public class CostumeRenderInfo
{
	public int costumeID;
	public bool haveBag;
	public Mesh[] meshes;
	public Material[] materials;
	public string[] rootBones;
	public Bounds[] localBounds;
}
