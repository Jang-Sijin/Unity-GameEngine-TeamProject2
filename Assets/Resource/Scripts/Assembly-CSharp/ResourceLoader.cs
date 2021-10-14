using Utils;

public class ResourceLoader : SingletonAsComponent<ResourceLoader>
{
	public enum ASSETBUNDLE
	{
		AT_NOTHING = 0,
		AT_SOUND = 1,
		AT_DATAS = 2,
		AT_COMPANION = 3,
		AT_ITEMS = 4,
		AT_UI = 5,
		AT_ITEM_ICON = 6,
		AT_ENEMIES = 7,
		AT_COSTUME_IMAGE = 8,
		AT_EVENTS = 9,
		AT_CINEMA = 10,
	}

}
