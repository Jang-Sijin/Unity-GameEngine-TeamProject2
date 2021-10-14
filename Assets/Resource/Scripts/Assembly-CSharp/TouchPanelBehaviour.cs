using UnityEngine.EventSystems;

public class TouchPanelBehaviour : EventTrigger
{
	public enum TouchObjectType
	{
		None = 0,
		EventTrigger = 1,
		DragObject = 2,
		DrawerTrigger = 3,
	}

	public bool enableDragObject;
	public TouchObjectType touchedObjectType;
	public TouchObjectType JoyStickObjectType;
}
