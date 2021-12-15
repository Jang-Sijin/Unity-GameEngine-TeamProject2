using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIStopMenuController : MonoBehaviour
{
   private FPSController _fps;

   public void StartGame()
   {
      _fps = GameObject.Find("Player").GetComponent<FPSController>();
      _fps.UiCheck = false;
      Cursor.lockState = CursorLockMode.Locked; // 마우스 포인터가 가운데로 갱신하도록 한다.
      Time.timeScale = 1.0f;
   }

   public void Quit()
   {
      Time.timeScale = 1.0f;
   }
}
