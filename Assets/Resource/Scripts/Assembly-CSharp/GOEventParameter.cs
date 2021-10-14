using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOEventParameter : ScriptableObject
{
	public bool val_bool;
	public int valueType;
	public int val_int;
	public float val_float;
	public Vector2 val_vect2;
	public Vector3 val_vect3;
	public Vector4 val_vect4;
	public Color val_color;
	public Rect val_rect;
	public string val_string;
	// public Object val_obj; // 오류 있었음.
	public List<GOEventParameter> lst_array;
}
