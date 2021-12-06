using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class LoadSceneManager : MonoBehaviour
{
    public Animator sceneTransition;

    public Button startButton;

    void Start()
    {
        
    }
    
    void Update()
    {
        // if (Input.GetMouseButtonDown(0)) // 마우스 좌클릭을 눌렀을 때
        // {
        //     startButton.GetComponent<Button>();
        //     startButton.onClick.AddListener(fClick);
        // }
    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            StartCoroutine(TransitionNextScene(SceneManager.GetActiveScene().buildIndex,1));
        }
    }
    
    void fClick()
    {
        StartCoroutine(TransitionNextScene(SceneManager.GetActiveScene().buildIndex,0));
    }
    
    // value 버튼 클릭인가 아님 충돌처리인가로 씬 이동 결정
    // 0 : 메인씬 1~: 다른 씬이동
    public IEnumerator TransitionNextScene(int levelIndex,int value)
    {
        sceneTransition.SetTrigger("Start");
        
        yield return new WaitForSeconds(0.0f);
        if (levelIndex == 0)
        {
            SceneManager.LoadScene(levelIndex + 1);
        }
        else
        {
            if (value == 0)
            {
                SceneManager.LoadScene(0);
            }
            else
            {
                SceneManager.LoadScene(2);
            }
        }
    }
}
