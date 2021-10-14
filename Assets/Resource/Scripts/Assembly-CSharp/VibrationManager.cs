using UnityEngine;
using System;

public class VibrationManager : MonoBehaviour
{
	[Serializable]
	public struct VibrationData
	{
		public VibrationData(int defaultVibrationL, int defaultVibrationR, float totalTime, float vibrationTime, float intervalTime) : this()
		{
		}

		public int defaultVibrationL;
		public int defaultVibrationR;
		public float totalTime;
		public float vibrationTime;
		public float intervalTime;
	}

	[SerializeField]
	private VibrationData vibrationData;
	public bool isPlay;
}
