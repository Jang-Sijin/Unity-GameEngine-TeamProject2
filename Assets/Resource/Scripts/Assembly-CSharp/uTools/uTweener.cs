using UnityEngine;
using UnityEngine.Events;

namespace uTools
{
	public class uTweener : MonoBehaviour
	{
		public AnimationCurve animationCurve;
		public EaseType easeType;
		public LoopStyle loopStyle;
		public float delay;
		public float duration;
		public bool ignoreTimeScale;
		public UnityEvent onFinished;
	}
}
