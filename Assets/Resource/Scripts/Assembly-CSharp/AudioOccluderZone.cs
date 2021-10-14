using UnityEngine;
using System.Collections.Generic;

public class AudioOccluderZone : MonoBehaviour
{
	[SerializeField]
	private int m_FloorLevel;
	[SerializeField]
	private List<AudioOccluderPoint> m_AudioPointList;
}
