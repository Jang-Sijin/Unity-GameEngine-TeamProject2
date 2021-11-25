using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UiMainMenuController : MonoBehaviour
{
    public AudioClip startAudioClip;
    public AudioClip optionAudioClip;
    public AudioClip quitAudioClip;
    public AudioClip backAudioClip;

    private void Start()
    {
        Cursor.lockState = CursorLockMode.None; // 마우스 포인터가 움직이도록 한다.
        Cursor.visible = true; // 마우스 포인터가 보이도록 설정한다.
    }

    public void StartButton()
    {
        SoundManager.instance.SfxPlay("StartButton", startAudioClip);
    }

    public void OptionButton()
    {
        SoundManager.instance.SfxPlay("OptionButton", optionAudioClip);
    }

    public void QuitButton()
    {
        SoundManager.instance.SfxPlay("OptionButton", quitAudioClip);
        Application.Quit();
    }
    
    public void BackButton()
    {
        SoundManager.instance.SfxPlay("BackButton", backAudioClip);
    }
    
}
