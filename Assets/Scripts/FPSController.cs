using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class FPSController : MonoBehaviour
{
        [Header("UI Settings")]
        //public GameObject SetActiveUiCommand;
        public GameObject SetActiveUiPause;
        //public GameObject SetActiveUiOption;
        //public GameObject SetActiveUiQuit;
        public bool UiCheck = false;
    
        [Header("Movement Settings")]
        public float moveSpeed = 2f; // 이동 속도
        public float crouchSpeed = 0.4f; // 앉기 속도
        public float runSpeedMultiplier = 2f; // 달리는 속도 = 이동 속도 ^ n승

        public float crouchHeight = 0.5f; // 앉기 값

        [HideInInspector]
        private static bool crouch = false; // 앉기
        public bool lockCursor; // 커서 고정
        
        private CharacterController characterController;
        public Transform camHolder;
        private float moveSpeedLocal;
        
        private float distanceToGround;

        [HideInInspector]
        public Animator mainCameraAnimator;

        [HideInInspector]
        public bool isClimbing = false;

        [HideInInspector]
        public bool mouseLookEnabled = true;
        
        private Vector3 previousPos = new Vector3();
        
        Vector3 dirVector;

        InputManager inputManager;

        private float defaultColliderHeight;

        public static bool canMove = true;

        [Header("MouseLook Settings")]

        private float clampY = 160;
        public Vector2 sensitivity = new Vector2(0.5f, 0.5f);
        public Vector2 smoothing = new Vector2(3, 3);

        [HideInInspector]
        public Vector2 targetDirection;
        [HideInInspector]
        public Vector2 _mouseAbsolute;
        [HideInInspector]
        public Vector2 _smoothMouse;

        [Header("Landing and air")]
        public AudioClip softLandingSound;
        public AudioClip hardLandingSound;
        
        public float hardLandingTime = 2f;

        private AudioSource audioSource;
        private float airTime;

        [HideInInspector]
        public bool hitTheGround = true;
        
        [HideInInspector]
        public static float highestTriggerEdge = -9999;

        private void OnEnable()
        {
            characterController = GetComponent<CharacterController>();

            defaultColliderHeight = GetComponent<CharacterController>().height; // 캐릭터 키(높이)

            distanceToGround = GetComponent<CharacterController>().bounds.extents.y;
            mainCameraAnimator = Camera.main.GetComponent<Animator>();
            
            audioSource = GetComponent<AudioSource>();
            inputManager = FindObjectOfType<InputManager>();

            if (lockCursor)
            {
                Cursor.visible = false;
                Cursor.lockState = CursorLockMode.Locked;
            }
        }

        [HideInInspector]
        public Vector2 recoil;

        Vector3 moveDirection;
        public float gravity = 10f;

        private bool lastSwimmingState;

        private void Update()
        {
            // UI settings start
            if (Input.GetKeyDown(KeyCode.Escape) /*&& !SetActiveUiCommand.activeSelf && !SetActiveUiQuit.activeSelf*/)
            {
                if (!UiCheck)
                {
                    Cursor.visible = true;// 마우스 포인터가 보이도록 설정한다.
                    UiCheck = true;
                    SetActiveUiPause.SetActive(true);
                    Cursor.lockState = CursorLockMode.None; // 마우스 포인터가 움직이도록 한다.
                    Time.timeScale = 0.0f;
                }
                else
                {
                    Cursor.visible = false;// 마우스 포인터가 보이지 않도록 설정한다.
                    UiCheck = false;
                    SetActiveUiPause.SetActive(false);
                    //SetActiveUiOption.SetActive(false);
                    Cursor.lockState = CursorLockMode.Locked; // 마우스 포인터가 가운데로 갱신하도록 한다.
                    Time.timeScale = 1.0f;
                }
            }
            // UI settings end
            
            // Player Controller
            if (!UiCheck)
            {
                if (characterController == null)
                    GetComponent<CharacterController>();


                if (!IsGrounded())
                {
                    airTime += Time.deltaTime;
                }
                else
                {
                    if (airTime > hardLandingTime)
                    {
                        mainCameraAnimator.Play("HardLanding");
                        if (hardLandingSound != null)
                            audioSource.PlayOneShot(hardLandingSound);

                    }
                    else if (airTime > 0.3f)
                    {
                        mainCameraAnimator.Play("SoftLanding");
                        if (softLandingSound != null)
                            audioSource.PlayOneShot(softLandingSound);
                    }

                    airTime = 0;
                }

                if (!canMove)
                    return;

                StandaloneMovement();

                Crouch();

                CharacterMovement();
                if (mouseLookEnabled && lockCursor)
                    MouseLook();

                if (!isClimbing)
                {
                    characterController.Move(moveDirection * Time.deltaTime);
                }

                if (lastSwimmingState == true)
                {
                    lastSwimmingState = false;
                }
            }
        }

        void MouseLook()
        {
            Quaternion targetOrientation = Quaternion.Euler(targetDirection);

            Vector2 mouseDelta = new Vector2();
            
            mouseDelta = new Vector2(Input.GetAxis("Mouse X"), Input.GetAxis("Mouse Y"));
            mouseDelta = Vector2.Scale(mouseDelta, new Vector2(sensitivity.x * smoothing.x, sensitivity.y * smoothing.y));

            _smoothMouse.x = Mathf.Lerp(_smoothMouse.x, mouseDelta.x, 1f / smoothing.x);
            _smoothMouse.y = Mathf.Lerp(_smoothMouse.y, mouseDelta.y, 1f / smoothing.y);
            
            _mouseAbsolute += _smoothMouse;

            if (recoil != Vector2.zero)
            {
                _mouseAbsolute.x += recoil.x;
                _mouseAbsolute.y += recoil.y;
                recoil = Vector2.zero;
            }

            if (_mouseAbsolute.y < -clampY * 0.5f)
                _mouseAbsolute.y = -clampY * 0.5f;

            if (_mouseAbsolute.y > clampY * 0.5f)
                _mouseAbsolute.y = clampY * 0.5f;
            
            var xRotation = Quaternion.AngleAxis(-_mouseAbsolute.y, targetOrientation * Vector3.right);
            camHolder.transform.localRotation = xRotation;

            var yRotation = Quaternion.AngleAxis(_mouseAbsolute.x, camHolder.transform.InverseTransformDirection(Vector3.up));
            camHolder.transform.localRotation *= yRotation;
            camHolder.transform.rotation *= targetOrientation;
        }

        public float distanceToWallRaiseWeaponUp = 0.1f;

        public bool PlayerCloseToWall()
        {
            RaycastHit hit;

            if(Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward * distanceToWallRaiseWeaponUp, out hit, distanceToWallRaiseWeaponUp))
            {
                return true;
             
            }
            else
            {
                return false;
            }
        }

        void StandaloneMovement()
        {
            if (canMove == false)
                return;

            if (IsGrounded())
            {
                if (CheckMovement())
                {
                    moveSpeedLocal = moveSpeed;
                }

                if (Input.GetKey(inputManager.Run) && !isClimbing && !crouch)
                { 
                    moveSpeedLocal = runSpeedMultiplier * moveSpeed;
                }
            }

            if (crouch)
            {
                moveSpeedLocal = crouchSpeed;
            }

            if (Input.GetKeyDown(inputManager.Crouch))
            {
                crouch = !crouch;
            }
        }

        void CharacterMovement()
        {
            if (canMove == false)
                return;

            var camForward = camHolder.transform.forward;
            var camRight = camHolder.transform.right;

            if (hitTheGround)
            {
                camForward.y = 0f;
                camRight.y = 0f;
            }
            
            camForward.Normalize();
            camRight.Normalize();

            
            gravity = 10;

            // 중력 설정!!!
            if(!isClimbing)
                moveDirection.y -= gravity * Time.deltaTime;

            if (isClimbing)
            {
                crouch = false;
                
                dirVector = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
                
                Vector3 verticalDirection = transform.up;
                Vector3 moveDirection = (verticalDirection) * dirVector.z+ camRight * dirVector.x;
                
                characterController.Move(transform.position + moveDirection * moveSpeedLocal * Time.deltaTime);
            }
            else if(!isClimbing)
            {
                dirVector = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
                Vector3 moveDirection = camForward * dirVector.z + camRight * dirVector.x;

                characterController.Move(moveDirection * moveSpeedLocal * Time.deltaTime);
            }

            // print("highestTriggerEdge : " + highestTriggerEdge + "/n" + "hitTheGround : " + hitTheGround);
            
        }

        public static bool CheckMovement()
        {
            if (Input.GetAxis("Vertical") > 0 || Input.GetAxis("Vertical") < 0 || Input.GetAxis("Horizontal") > 0 || Input.GetAxis("Horizontal") < 0)
            {
                    return true;
            }

            return false;
        }
        
        void Crouch()
        {
            if (crouch == true)
            {
                characterController.height = Mathf.Lerp(characterController.height, crouchHeight, Time.deltaTime * 8);
                camHolder.transform.localPosition = Vector3.Lerp(camHolder.transform.localPosition, new Vector3(0, 0.2f, 0), Time.deltaTime * 4 );
            }
            else
            {
                characterController.height = Mathf.Lerp(characterController.height, defaultColliderHeight, Time.deltaTime * 8);
                camHolder.transform.localPosition = Vector3.Lerp(camHolder.transform.localPosition, new Vector3(0, 0.4f, 0), Time.deltaTime * 2);
            }
        }
        
        public float GetVelocityMagnitude()
        {
            var velocity = ((transform.position - previousPos).magnitude) / Time.deltaTime;
            previousPos = transform.position;
            return velocity;
        }

        private bool haveCollision = false;

        public bool IsGrounded()
        {
            haveCollision = characterController.isGrounded;

            if (!haveCollision)
            {
                return Physics.Raycast(transform.position, -Vector3.up, distanceToGround + 0.5f);
            }
            else
            {
                hitTheGround = true;
            }

            return true;
        }
}
