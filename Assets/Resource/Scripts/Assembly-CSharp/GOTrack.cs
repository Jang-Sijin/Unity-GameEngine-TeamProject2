using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class GOTrack : ScriptableObject
{
	[SerializeField]
	private int _actor_index;
	public int _id;
	public string _name;
	public List<GOKey> _keys;
	public List<GOAction> _caches;
	public bool _fold_out;
	public GOTake _parent_take;
}
