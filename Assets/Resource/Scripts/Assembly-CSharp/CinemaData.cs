using UnityEngine;
using System.Collections.Generic;

public class CinemaData : MonoBehaviour
{
	public List<GOTake> takes;
	public GOTake play_on_start;
	public bool record_mode;
	public bool _is_recording;
	public AVProMovieCaptureFromScene _record_component;
	public bool is_cinema_open;
	public bool is_inspector_open;
	public bool in_play_mode;
	public float zoom;
	public int current_take;
	public int code_language;
	public float gizmo_size;
	public float width_track;
	public bool auto_key;
	public float elapsed_time;
	public string stringToEdit;
}
