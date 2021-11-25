using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SoundManager : MonoBehaviour
{
    public AudioSource backGroundSound;
    public AudioClip[] backGroundList; // 배경음 리스트
    
    public static SoundManager instance; // Sound Manager을 싱글톤으로 관리
    private void Awake()
    {
        // Sound Manager 싱글톤 설정
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(instance);
            SceneManager.sceneLoaded += OnSceneLoaded;
        } 
        else
        { 
            Destroy(gameObject);  
        }
    }

    private void OnSceneLoaded(Scene arg0, LoadSceneMode arg1) // Scene에 따라서 Bg Sound가 변경된다.
    {
        for (int i = 0; i < backGroundList.Length; i++)
        {
            if (arg0.name == backGroundList[i].name) // Scene의 이름과 배경음 이름이 같으면
            {
                BgSoundPlay(backGroundList[i]); // 배경음 실행
            }
            else // Scene의 이름과 배경음 이름이 다르면 배경음 없도록(null) 설정
            {
                BgSoundPlay(null);
            }
        }
    }

    public void SfxPlay(string sfxName, AudioClip clip)
    {
        GameObject go = new GameObject(sfxName + "Sound"); // Sound GameObject 생성
        AudioSource audioSource = go.AddComponent<AudioSource>(); // 사운드 재생을 위해서 AudioSource 컴포넌트를 추가
        audioSource.clip = clip; // 오디오 클립을 매개변수로 받아온다.
        audioSource.Play(); // 오디오 재생
        
        Destroy(go, clip.length); // Destroy(파괴할 오브젝트, 지연시간); // 오디오를 끝까지 재생하면 오브젝트를 파괴한다.
    }

    public void BgSoundPlay(AudioClip clip)
    {
        backGroundSound.clip = clip; // 배경음 오디오 클립 설정
        backGroundSound.loop = true; // 반복 모드
        backGroundSound.volume = 1.0f; // 배경음 소리 값 설정
        backGroundSound.Play(); // 배경음 실행
    }
}
