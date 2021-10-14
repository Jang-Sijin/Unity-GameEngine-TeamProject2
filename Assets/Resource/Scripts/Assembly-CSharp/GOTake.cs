using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOTake : ScriptableObject
{
	public GOTake(string name)
	{
	}

	public string _name;
	public int _frame_rate;
	public int _num_frames;
	public float _start_frame;
	public float _end_frame;
	public int _playback_speed_index;
	public int _selected_track;
	public int _selected_frame;
	public int _selected_group;
	public List<int> _track_keys;
	public List<GOTrack> _track_values;
	public List<int> _context_selection;
	public List<int> _ghost_selection;
	public List<int> _context_selection_tracks;
	public int _track_count;
	public int _group_count;
	public GOGroup _root_group;
	public List<int> _group_keys;
	public List<GOGroup> _group_values;
	public GOCameraSwitchTrack _camera_switcher;
}
