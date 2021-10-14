using UnityEngine;

public class PlayerBehaviour : CharacterBehaviour
{
	public GameObject minjiPrefab;
	public LighterBehaviour lighter;
	public bool ignoreInput;
	public bool enableMoving;
	public bool forcedFirstPersonView;
	public bool godMode;
	public Transform nodeHeadCamera;
	public Transform nodeRightHand;
	public Transform nodeLeftHand;
	public Transform nodeLighter;
	[SerializeField]
	private float m_MinControllerRadius;
	[SerializeField]
	private float m_MaxControllerRadius;
}
