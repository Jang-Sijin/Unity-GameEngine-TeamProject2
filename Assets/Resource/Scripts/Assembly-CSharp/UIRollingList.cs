using UnityEngine;
using UnityEngine.UI;

public class UIRollingList : MonoBehaviour
{
	public UIRollingListGrid grid;
	public Scrollbar scrollBar;
	public UICell cellPrefab;
	public bool onScrollBar;
	public bool onRolling;
	public int cellDivisionCnt;
}
