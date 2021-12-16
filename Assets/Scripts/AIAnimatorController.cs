using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using AIBehavior;

public class AIAnimatorController : MonoBehaviour
{
    private AIBehaviors behaviors;
    [SerializeField] private Animator animator;
    private void Awake()
    {
        behaviors = GetComponent<AIBehaviors>();
    }
    // Start is called before the first frame update
    void Start()
    {
        behaviors.onStateChanged = OnStateChanged;
    }
    private void OnStateChanged(BaseState state, BaseState baseState)
    {
        if (state is PatrolState)
        {
            animator.SetBool("isMoving", true);
        }else if (state is IdleState)
        {
            
        }
    }
    // Update is called once per frame
    void Update()
    {
    }
}
