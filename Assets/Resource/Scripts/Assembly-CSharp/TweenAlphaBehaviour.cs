using UnityEngine;
using UnityEngine.UI;

public class TweenAlphaBehaviour : MonoBehaviour
{
	public Image _image;
	public float _duration;
	public AnimationCurve _curve;
	public bool _fade_out;
	[SerializeField]
	private float _threshold;
}
