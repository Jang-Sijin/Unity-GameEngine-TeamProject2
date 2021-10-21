using UnityEngine;

public class ObjectDetectionRaycast : MonoBehaviour
{

    // UI Settings
    public GameObject activeUIDoorPrefab; // 플레이어가 문에 도달하였을 때 표시할 UI 프리팹
    [HideInInspector] public GameObject activeUIDoorPrefabInstance; // 원본 데이터 손상 방지를 위하나 프리팹 사본
    [HideInInspector] public bool activeUIDoor;

    // Raycast Settings
    public float RayReachDistance = 1.0F;
    [HideInInspector] public bool InReach;

    // Player Input Setting
    InputManager input;
    
    // Debug (RayLine)광선 Color Setting   
    public Color DebugRayColor;

    void Start()
    {
        gameObject.name = "Player";
        gameObject.tag = "Player";
        
        // 플레이어 Input Manager 가져옴
        input = FindObjectOfType<InputManager>();

        // 프리팹 지정이 안 되어있으면 오류 메시지 출력
        if (activeUIDoorPrefab == null) Debug.Log("<color=yellow><b>No activeUIDoorPrefab was found.</b></color>");
    }

    void Update()
    {
        // 광원점을 '화면 중앙', 광원 방향을 '카메라뷰'로 설정한다.
        Ray ray = Camera.main.ViewportPointToRay(new Vector3(0.5F, 0.5F, 0F));

        RaycastHit hit; // 광선 충돌 검출

        // 화면 중앙에서 플레이어가 보고 있는 곳으로 (Raycast)합니다.
        if (Physics.Raycast(ray, out hit, RayReachDistance))
        {
            if (hit.collider.tag == "Door") // 테그가 문(Door)일 때
            {
                // 문(Door) 열기/닫기 수행
                // ...
                InReach = true;

                // 디스플레이가 플레이어 문 손에 닿는 곳에 있을 때 UI 출력.
                if (activeUIDoor == false && activeUIDoorPrefab != null)
                {
                    activeUIDoorPrefabInstance = Instantiate(activeUIDoorPrefab);
                    activeUIDoor = true;
                    activeUIDoorPrefabInstance.transform.SetParent(transform, true); // 플레이어를 텍스트 요소의 상위 개체로 만듦
                }

                // 부딪힌 물체에 '도어'라는 이름을 지정합니다.
                GameObject Door = hit.transform.gameObject;

                // 부딪힌 객체에 부착된 '도어' 스크립트에 대한 액세스 권한 가져오기
                DoorRotationLite dooropening = Door.GetComponent<DoorRotationLite>();

                if (input.KeyDownPlayerUse())
                {
                    // '도어' 스크립트에 있는 '열림' 기능을 실행하여 도어를 열거나 닫습니다.
                    if (dooropening.RotationPending == false) StartCoroutine(hit.collider.GetComponent<DoorRotationLite>().Move());
                }
            }
            else
            {
                InReach = false;

                // 플레이어에서 (Raycast)를 쏘았을 때 더 이상 문에 닿지 않으면 UI 파괴
                if (activeUIDoor == true)
                {
                    DestroyImmediate(activeUIDoorPrefabInstance);
                    activeUIDoor = false;
                }
            }
        }
        else
        {
            InReach = false;

            // 플레이어에서 (Raycast)를 쏘았을 때 더 이상 문에 닿지 않으면 UI 파괴
            if (activeUIDoor == true)
            {
                DestroyImmediate(activeUIDoorPrefabInstance);
                activeUIDoor = false;
            }
        }
        
        //디버깅용 색칠된 레이(광)선 출력
        Debug.DrawRay(ray.origin, ray.direction * RayReachDistance, DebugRayColor);
    }
}
