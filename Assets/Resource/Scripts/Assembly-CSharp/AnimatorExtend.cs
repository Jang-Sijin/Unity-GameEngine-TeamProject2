using UnityEngine;
using System.Collections.Generic;

public class AnimatorExtend : MonoBehaviour
{
	public AnimatorOverrideController _original_controller;
	public AnimatorOverrideController _cinema_controller;
	public bool _is_camera;
	public List<GameObject> _lst_equiped_items;
	public bool m_bIgnoreChangeAniController;
}
