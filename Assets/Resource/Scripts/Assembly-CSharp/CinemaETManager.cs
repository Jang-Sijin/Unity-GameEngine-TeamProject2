using System;
using UnityEngine;
using System.Collections.Generic;

public class CinemaETManager : Singleton<CinemaETManager>
{
	[Serializable]
	public class group_effects
	{
		public int group_id;
		public GameObject[] array_effects;
	}

	public List<EventTrigger> lst_et_objects;
	public CharacterController _controller;
	public CharacterController _controller2;
	public List<GameObject> _lst_effects;
	public List<GameObject> _lst_test_effects;
	public List<LightControllerBehaviour> _lst_light_contollers;
	public Light _cinema_directional_light;
	public Light _cinema_point_light;
	public Color _default_directional_light;
	public GameObject event_Triggers;
	public List<CinemaETManager.group_effects> _lst_group_effects;
}
