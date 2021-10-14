using UnityEngine;

public class BalancePuzzleBehaviour : MonoBehaviour
{
	public Transform balanceArm;
	public Transform leftPlate;
	public Transform rightPlate;
	public Transform leftJoint;
	public Transform rightJoint;
	public GameObject[] putonScaleWeights;
	public GameObject[] putdownScaleWeights;
	public int[] scaleWeightsItemID;
	public int[] scaleWeightsWeight;
	public GameObject targetObject;
	public int targetObjectID;
	public int targetWeight;
	public EventTrigger clearTrigger;
}
