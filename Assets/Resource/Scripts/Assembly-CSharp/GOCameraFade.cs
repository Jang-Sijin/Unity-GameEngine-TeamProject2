using UnityEngine;

public class GOCameraFade : MonoBehaviour
{
	public bool deleteMe;
	public bool updateTexture;
	public int keepAlives;
	public bool keepAliveColor;
	public bool keepAlivePreview;
	public bool keepAliveAwake;
	public int mode;
	public float percent;
	public float value;
	public bool useRenderTexture;
	public Texture2D tex2d;
	public RenderTexture _tex;
	public float[] r;
	public Camera renderTextureCamera;
	public bool hasColorTex;
	public bool hasColorBG;
	public Color colorTex;
	public Color colorBG;
	public int width;
	public int height;
	public bool placeholder;
	public Texture2D irisShape;
	public Texture background;
	public int cachedStillFrame;
	public bool isReset;
	public bool shouldUpdateStill;
	public bool shouldUpdateRenderTexture;
	public bool preview;
}
