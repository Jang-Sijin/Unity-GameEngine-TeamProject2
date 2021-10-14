using UnityEngine;
using UnityEngine.Events;

public class MaskingFaderBehaviour : MonoBehaviour
{
	public Texture2D _gradation_texture;
	public float _duration;
	public bool _play_on_awake;
	public bool _flip_after_animation;
	public bool _flip;
	public bool _invert;
	public AnimationCurve _curve;
	[SerializeField]
	private float _threshold;
	public UnityEvent onFadeBehaviourStart;
	public UnityEvent onFadeBehaviourComplete;
}
