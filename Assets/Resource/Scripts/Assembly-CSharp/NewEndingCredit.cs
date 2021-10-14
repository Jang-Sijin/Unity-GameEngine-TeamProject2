using UnityEngine;
using System;
using UnityEngine.UI;
using uTools;
using System.Collections.Generic;

public class NewEndingCredit : MonoBehaviour
{
	[Serializable]
	public class EffectInfo
	{
		public GameObject effectPrefab;
		public string parentNodeName;
		public Vector3 position;
		public Vector3 rotaiton;
	}

	[Serializable]
	public class ModelInfo
	{
		public NewEndingCredit.EndingCreditActors actor;
		public string playAnimationName;
		public Vector3 localPosition;
		public Quaternion rotation;
		public GameObject gameObject;
		public NewEndingCredit.EffectInfo[] effectInfoList;
	}

	[Serializable]
	public struct SceneInfo
	{
		public string desc;
		public float scenePlayTime;
		public NewEndingCredit.ModelInfo[] modelInfos;
		public bool skip;
	}

	public enum EndingCreditActors
	{
		HM = 0,
		SA = 1,
		JH = 2,
		SY = 3,
		BG = 4,
		BS = 5,
		YH = 6,
		JW = 7,
		SA_G = 8,
		DS = 9,
		EM_G = 10,
		EM = 11,
		MJ = 12,
	}

	public GameObject[] prefabs;
	public RuntimeAnimatorController[] animatorControllers;
	public MeshRenderer meshRenderer;
	public GameObject modelContainer;
	public Text uiText;
	public uTweenPosition tweenPosition;
	public uTweenAlpha tweenAlpha;
	public uTweenValue tweenValue;
	public List<NewEndingCredit.SceneInfo> sceneInfoList;
	public int sceneIndex;
	public float playTime;
	public float checkSceneTime;
	public float animationTime;
	public float startDelay;
	public float nextDelay;
	public float bgmDelay;
	public Material mDissolveMaterial;
	public GameObject mHideObjects;
	public RectTransform contentRectTransform;
	public RectTransform canvasRectTransform;
	public Button _skip_button;
	public Text _skip_text;
}
