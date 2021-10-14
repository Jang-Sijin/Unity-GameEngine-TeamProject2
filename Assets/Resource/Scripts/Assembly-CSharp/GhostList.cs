using UnityEngine;

public class GhostList : SelectableEx
{
	public RectTransform content;
	public GameObject ghostListItemPrefabs;
	[SerializeField]
	private float m_ContentItemWidth;
	[SerializeField]
	private float m_MoveDuration;
	public UIImageNumbers currentEncountCounter;
	public UIImageNumbers maxEncountCounter;
	public UIImageNumbers currentStoryCounter;
	public UIImageNumbers maxStoryCounter;
	public int encounterCnt;
	public int storyCnt;
}
