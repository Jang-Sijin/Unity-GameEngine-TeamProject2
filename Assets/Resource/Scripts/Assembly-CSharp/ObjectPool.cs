using UnityEngine;
using System;

public class ObjectPool : MonoBehaviour
{
	[Serializable]
	public class StartupPool
	{
		public int _size;
		public GameObject _prefab;
	}

	public enum StartupPoolMode
	{
		Awake = 0,
		Start = 1,
		CallManually = 2,
	}

	public StartupPoolMode _startup_pool_mode;
	public StartupPool[] _arr_startup_pools;
}
