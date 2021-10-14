using UnityEngine;
using UnityEngine.UI;

public class ResultScene : MonoBehaviour
{
	public GameObject resultParentUI;
	public GameObject _result_UI;
	public Text _ending_text;
	public Text _difficulty_text;
	public Text[] _texts;
	public Text _total_point;
	public Text _user_title_text;
	public GameObject _point_confirm_effect;
	public GameObject _result_grade;
	public GameObject _result_grade_effect;
	public GameObject _button_go_main;
	public GameObject _text_go_main;
	public Sprite[] _grade_images;
	public Sprite[] _grade_plus_images;
	public Image _grade_image;
	public Image _grade_plus;
	public Color _original_color;
	public Color _confirm_color;
	public Image _leaderboard_image;
	public Sprite[] _leaderboard_sprites;
	public Text[] _localization_texts;
	public Text TotalPlayTime_text;
}
