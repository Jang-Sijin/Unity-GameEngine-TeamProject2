using UnityEngine;

public class HeadTraceBehaviour : MonoBehaviour
{
	public Transform _root_node;
	public bending_segement[] _segments;
	public non_affected_joints[] _non_affected_joints;
	public Vector3 _head_look_vector;
	public Vector3 _head_up_vector;
	public Transform _target_transfom;
	public float sightHeight;
	public float _effect;
	public bool _override_animation;
	public bool verticalLimit;
}
