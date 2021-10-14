using System;
using UnityEngine;

[Serializable]
public class Vibrationdata
{
	[SerializeField]
	private int id;
	[SerializeField]
	private int vibrationL;
	[SerializeField]
	private int vibrationR;
	[SerializeField]
	private int modifierL;
	[SerializeField]
	private int modifierR;
	[SerializeField]
	private float totalTime;
	[SerializeField]
	private float vibrationTime;
	[SerializeField]
	private float intervalTime;
}
