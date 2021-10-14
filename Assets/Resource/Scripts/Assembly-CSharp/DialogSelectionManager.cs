using UnityEngine;
using UnityEngine.UI;

public class DialogSelectionManager : Singleton<DialogSelectionManager>
{
	public GameObject _caption_panel;
	public GameObject _selection_panel;
	public Button _1_selection_object;
	public Button _2_selection_object;
	public Text _1_selection_text;
	public Text _2_selection_text;
	public int _current_id;
}
