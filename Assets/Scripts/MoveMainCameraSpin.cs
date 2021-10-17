using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveMainCameraSpin : MonoBehaviour
{
    Animator animator;
    InputManager input;
    FPSController controller;

    public float runHeadSpinSpeed = 2;


    private void Start()
    {
        animator = GetComponent<Animator>();
        input = FindObjectOfType<InputManager>();
        controller = FindObjectOfType<FPSController>();
    }

    private void Update()
    {
        if (animator == null)
            return;

        if (controller.IsGrounded() && FPSController.canMove == true)
        {
            animator.SetFloat("Horizontal", Input.GetAxis("Horizontal"));
            animator.SetFloat("Vertical", Input.GetAxis("Vertical"));

            animator.SetBool("Run", input.IsRunning());
        }
        else
        {
            animator.SetFloat("Horizontal", 0);
            animator.SetFloat("Vertical", 0);

            animator.SetBool("Run", false);
        }
    }
}
