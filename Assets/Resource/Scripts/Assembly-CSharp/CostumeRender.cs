using UnityEngine;
using System.Collections.Generic;

public class CostumeRender : MonoBehaviour
{
	public List<SkinnedMeshRenderer> mSkinnedMeshRenderers;
	public CostumeRenderInfo mOriginalRenderInfo;
	public CostumeRenderInfo mCurrentRenderInfo;
	public CostumeData mCurrentCostumeData;
	[SerializeField]
	private AccountManager.Character m_Character;
	[SerializeField]
	private int m_CostumeID;
	public bool InLobby;
}
