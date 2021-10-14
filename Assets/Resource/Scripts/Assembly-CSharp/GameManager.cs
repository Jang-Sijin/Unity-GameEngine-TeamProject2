using UnityEngine;
using UnityEngine.EventSystems;

public class GameManager : SceneManager
{
	public enum QTE
	{
		GhostTreeMan01_1 = 0,
		GhostTreeMan01_2 = 1,
		GhostTreeMan02_1 = 2,
		GhostTreeMan02_2 = 3,
		GhostBigBaby01 = 4,
		GhostBigBaby02_1 = 5,
		GhostBigBaby02_2 = 6,
		EunMi01_1 = 7,
		EunMi01_2 = 8,
		EunMi02_1 = 9,
		EunMi02_2 = 10,
		Hall_CN920 = 11,
		Hall_CN930 = 12,
		Hall_CN950L = 13,
		Hall_CN950R = 14,
		Hall_CN970L = 15,
		Hall_CN970R = 16,
		GhostFaceFish = 17,
		JiMin2181_1 = 18,
		JiMin2181_2 = 19,
		JiMin2181_3 = 20,
		JiMin2181_4 = 21,
		JiMin2181_5 = 22,
		JiMin2181_6 = 23,
		JiMin2181_7 = 24,
		JiMin2181_8 = 25,
		JiMin2181_9 = 26,
	}

	public PlayerBehaviour player;
	public NonPlayerBehaviour heeMin;
	public NonPlayerBehaviour sungA;
	public NonPlayerBehaviour jiHyeon;
	public NonPlayerBehaviour soYoung;
	public NonPlayerBehaviour minJi;
	public SecurityGuardBehaviour bonGu;
	public SecurityGuardBehaviour dalSu;
	public GhostWomanHeadBehaviour womanHead;
	public MainCameraBehaviour mainCamera;
	public PointCameraBehaviour pointCamera;
	public Transform cameraTracer;
	public Camera cinemaCamera;
	public Camera cinemaCamera1;
	public Camera cinemaCamera2;
	public GameInterface UI;
	public Light characterLight;
	public ItemRendererBehaviour itemRenderer;
	public bool isSaveEnable;
	public bool isCinemaState;
	public bool isCinemaPlaying;
	public int frameRate;
	public GameObject cinemaAssets;
	public GameObject cinemaSkip;
	public MouseCustomize mouse;
	public EventSystem EventSystem;
	public int TargetObjectIndex;
	public QTE currentQTE;
}
