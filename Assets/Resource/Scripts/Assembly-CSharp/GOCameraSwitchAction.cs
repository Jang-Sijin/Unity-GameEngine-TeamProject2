using System.Collections.Generic;
using UnityEngine;

public class GOCameraSwitchAction : GOAction
{
	public int _end_frame;
	public int _camera_fade_type;
	public List<float> _camera_fade_parameters;
	public Texture2D _iris_shape;
	public bool _still;
	public int _start_target_type;
	public int _end_target_type;
	public Camera _start_camera;
	public Camera _end_camera;
	public Color _start_color;
	public Color _end_color;
}
