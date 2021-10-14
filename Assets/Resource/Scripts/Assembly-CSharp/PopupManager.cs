using System.Collections.Generic;
using UnityEngine;

public class PopupManager : Singleton<PopupManager>
{
	[SerializeField]
	private List<UIPopup> m_OpenedPopupList;
	[SerializeField]
	private int m_LastSortingOrder;
	[SerializeField]
	private Camera m_PopupCamera;
}
