using UnityEngine;
using System;
using System.Collections.Generic;

public class ProFlareAtlas : MonoBehaviour
{
	[Serializable]
	public class Element
	{
		public string name;
		public Rect UV;
		public bool Imported;
	}

	public Texture2D texture;
	public int elementNumber;
	public bool editElements;
	[SerializeField]
	public List<ProFlareAtlas.Element> elementsList;
	public string[] elementNameList;
}
