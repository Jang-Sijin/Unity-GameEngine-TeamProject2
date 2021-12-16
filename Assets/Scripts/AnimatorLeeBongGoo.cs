using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimatorLeeBongGoo : MonoBehaviour
{
    public float speed = 0f;
    private Animator _animator;
    
    // Start is called before the first frame update
    void Start()
    {
        _animator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (speed > 0)
        {
            _animator.SetBool("isMoving", true);


            _animator.SetBool("isRun", speed > 2);
        }
    }
}
