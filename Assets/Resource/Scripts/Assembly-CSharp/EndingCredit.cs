using UnityEngine;
using System;
using UnityEngine.UI;
using uTools;
using System.Collections.Generic;

public class EndingCredit : MonoBehaviour
{
	[Serializable]
	public struct ModelInfo
	{
		public GameObject prefab;
		public RuntimeAnimatorController animatorController;
		public string playAnimationName;
		public Vector3 localPosition;
		public Vector3 rotation;
		public bool move;
		public Vector3 moveDestination;
		public float moveSpeed;
	}

	[Serializable]
	public struct DirectInfo
	{
		public string desc;
		public float time;
		public EndingCredit.ModelInfo[] modelInfos;
	}

	[Serializable]
	public struct SceneInfo
	{
		public string desc;
		public float sceneTime;
		public EndingCredit.DirectInfo[] directInfos;
	}

	public GameObject[] prefabs;
	public RuntimeAnimatorController[] animatorControllers;
	public GameObject modelContainer;
	public Text uiText;
	public uTweenPosition tweenPosition;
	public List<EndingCredit.SceneInfo> sceneInfoList;
	public int viewIndex;
	public int prefabIndex;
	public float playTime;
	public float checkSceneTime;
	public float animationTime;
	[SerializeField]
	private Material m_Material;
	[SerializeField]
	private List<GameObject> m_InstanceObjects;
}
