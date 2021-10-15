using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FPSController : MonoBehaviour
{
        [Header("Movement Settings")]
        public float moveSpeed = 1f;
        public float crouchSpeed = 0.4f;
        public float runSpeedMultiplier = 2f;

        public float crouchHeight = 0.5f;

        [HideInInspector]
        public static bool crouch = false;
        public bool lockCursor;
        
        // PlayerStats playerStats;
        private CharacterController characterController;
        public Transform camHolder;
        private float moveSpeedLocal;
        
        private float distanceToGround;

        [HideInInspector]
        public Animator mainCameraAnimator;

        // private WeaponManager weaponManager;

        [HideInInspector]
        public bool isClimbing = false;

        private float inAirTime;

        [HideInInspector]
        public bool mouseLookEnabled = true;

        //Velocity calculation variable
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
            // if (!InputManager.useMobileInput)
            // {
            //     Cursor.lockState = CursorLockMode.Confined;
            //     Cursor.visible = false;
            // }

            characterController = GetComponent<CharacterController>();

            defaultColliderHeight = GetComponent<CharacterController>().height;

            distanceToGround = GetComponent<CharacterController>().bounds.extents.y;
            mainCameraAnimator = Camera.main.GetComponent<Animator>();

            // playerStats = FindObjectOfType<PlayerStats>();
            audioSource = GetComponent<AudioSource>();
            // weaponManager = FindObjectOfType<WeaponManager>();
            inputManager = FindObjectOfType<InputManager>();
        }

        [HideInInspector]
        public Vector2 recoil;

        Vector3 moveDirection;
        public float gravity = 10f;

        private bool lastSwimmingState;

        private void Update()
        {
            if (characterController == null)
                GetComponent<CharacterController>();

            
            if (!isGrounded())
            {
                airTime += Time.deltaTime;
            }
            else
            { 
                if (airTime > hardLandingTime) 
                {
                        mainCameraAnimator.Play("HardLanding");
                        // playerStats.ApplyDamage((int)(playerStats.minFailingDamage * airTime));
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
            
            // if (!InputManager.useMobileInput)
            // {
                StandaloneMovement();
            // }
            // else
            // {
            //     MobileMovement();
            // }
       
            Crouch();
            Landing();

            CharacterMovement();
            // if (mouseLookEnabled && !InventoryManager.showInventory && lockCursor)
            //     MouseLook();

            if (!isClimbing)
            {
                // if (isGrounded() && playerStats.stamina > 5 && Input.GetButtonDown("Jump"))
                // {
                //     playerStats.stamina -= 5;
                //     moveDirection.y = jumpForce;
                // }
                    characterController.Move(moveDirection * Time.deltaTime);
            }

            if(lastSwimmingState == true)
            {
                lastSwimmingState = false;
            }

            // if(weaponManager.activeWeapon != null)
            //     weaponHolderAnimator.SetBool("Reloading",weaponManager.activeWeapon.reloading);
        }

        void MouseLook()
        {
            Quaternion targetOrientation = Quaternion.Euler(targetDirection);

            Vector2 mouseDelta = new Vector2();

            // if (InputManager.useMobileInput)
            // {
            //     mouseDelta = new Vector2(InputManager.touchPanelLook.x * Time.deltaTime, InputManager.touchPanelLook.y * Time.deltaTime);
            // }
            // else if (!InputManager.useMobileInput)
            // {
                mouseDelta = new Vector2(Input.GetAxis("Mouse X"), Input.GetAxis("Mouse Y"));
            //}

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

            // if(weaponHolderAnimator == null)
            // {
            //     weaponHolderAnimator = GameObject.Find("Weapon holder").GetComponent<Animator>();
            // }

            if (isGrounded())
            {
                if (CheckMovement())
                {
                    moveSpeedLocal = moveSpeed;
                }

                // if (Input.GetKey(inputManager.Run)&& playerStats.stamina > 0 && !isClimbing && !crouch && weaponHolderAnimator.GetBool("Walk") == true)
                // {
                //     moveSpeedLocal = runSpeedMultiplier * moveSpeed;
                //     weaponHolderAnimator.SetBool("Run", true);
                // }
                // else
                //     weaponHolderAnimator.SetBool("Run", false);
            }

            if (crouch)
            {
                moveSpeedLocal = crouchSpeed;
            }

            if (Input.GetKeyDown(inputManager.Crouch))
            {
                crouch = !crouch;
            }
            
            // if (Input.GetKeyDown(inputManager.Jump) && !isSwimming)
            // {
            //     crouch = false;
            // }
            
        }
        
        public void MobileMovement()
        {
            if (isGrounded())
            {
                if (CheckMovement())
                {
                    moveSpeedLocal = moveSpeed;
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
            // if (Input.GetKeyDown(inputManager.Jump))
            // {
            //     crouch = false;
            // }
            
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

            //Gravity!!!
            if(!isClimbing)
                moveDirection.y -= gravity * Time.deltaTime;

            if (isClimbing)
            {
                crouch = false;

                // if (!InputManager.useMobileInput)
                // {
                    dirVector = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
                // }
                // else if(InputManager.useMobileInput)
                // {
                //     dirVector = new Vector3(InputManager.joystickInputVector.x, 0, InputManager.joystickInputVector.y);
                // }
                
                Vector3 verticalDirection = transform.up;
                Vector3 moveDirection = (verticalDirection) * dirVector.z+ camRight * dirVector.x;
                
                characterController.Move(transform.position + moveDirection * moveSpeedLocal * Time.deltaTime);
            }
            else if(!isClimbing)
            {
                // if (!InputManager.useMobileInput)
                // {
                    dirVector = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
                // }
                // else if(InputManager.useMobileInput)
                // {
                //     dirVector = new Vector3(InputManager.joystickInputVector.x, 0, InputManager.joystickInputVector.y);
                // }
                Vector3 moveDirection = camForward * dirVector.z + camRight * dirVector.x;

                characterController.Move(moveDirection * moveSpeedLocal * Time.deltaTime);
            }
            else if(!isClimbing)
            {
                // if (!InputManager.useMobileInput)
                // {
                    dirVector = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical")).normalized;
                // }
                // else if (InputManager.useMobileInput)
                // {
                //     dirVector = new Vector3(InputManager.joystickInputVector.x, 0, InputManager.joystickInputVector.y);
                // }
                Vector3 moveDirection = camForward * dirVector.z + camRight * dirVector.x;

                characterController.Move(moveDirection * moveSpeedLocal * Time.deltaTime);
            }

            //print("Is Swimming : " + isSwimming + "/n" + "highestTriggerEdge : " + highestTriggerEdge + "/n" + "hitTheGround : " + hitTheGround);
            
        }

        public static bool CheckMovement()
        {
            // if (!InputManager.useMobileInput)
            // {
                if (Input.GetAxis("Vertical") > 0 || Input.GetAxis("Vertical") < 0 || Input.GetAxis("Horizontal") > 0 || Input.GetAxis("Horizontal") < 0)
                {
                    return true;
                }
            // }

            // if(InputManager.useMobileInput)
            // {
            //     if (InputManager.joystickInputVector.x > 0 || InputManager.joystickInputVector.x < 0 || InputManager.joystickInputVector.y > 0 || InputManager.joystickInputVector.y < 0)
            //         return true;
            // }

            return false;
        }
        
        void Crouch()
        {
            if (crouch == true)
            {
                characterController.height = Mathf.Lerp(characterController.height, crouchHeight, Time.deltaTime * 8);
                camHolder.transform.localPosition = Vector3.Lerp(camHolder.transform.localPosition, new Vector3(0, 0.2f, 0), Time.deltaTime * 4 );
                //Ray ray = new Ray();
                //ray.origin = transform.position;
                //ray.direction = transform.up;
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
        
        public void CrouchMobile()
        {
            crouch = !crouch;
        }

        private bool haveCollision = false;

        public bool isGrounded()
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

        void Landing()
        {
            if(!isGrounded())
            {
                inAirTime += Time.deltaTime;
            }
            else
            {
                inAirTime = 0;
            }
        }
}
