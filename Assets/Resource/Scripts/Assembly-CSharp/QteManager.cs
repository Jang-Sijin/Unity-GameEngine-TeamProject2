using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class QteManager : Singleton<QteManager>
{
	public List<GameObject> _lst_drag_boxes;
	public GameObject _drop_box;
	public GameObject _skip_button;
	public GameObject _button_qte;
	public GameObject _swipe_Icon;
	public GameObject _qte_hint;
	public Text _qte_hint_text;
	public float _judge_duration;
	public float _min_swipe_distance_pixels;
}
