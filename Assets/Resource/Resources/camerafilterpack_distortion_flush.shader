Shader "CameraFilterPack/Distortion_Flush" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 22848
			Program "vp" {
				SubProgram "d3d9 " {
					"vs_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   row_major float4x4 glstate_matrix_mvp;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   glstate_matrix_mvp c0       4
					//
					
					    vs_3_0
					    dcl_position v0
					    dcl_color v1
					    dcl_texcoord v2
					    dcl_texcoord o0.xy
					    dcl_position o1
					    dcl_color o2
					    dp4 r0.x, c0, v0
					    dp4 r0.y, c1, v0
					    dp4 r0.z, c2, v0
					    dp4 r0.w, c3, v0
					    mov o0.xy, v2
					    mov o2, v1
					    mad o1.xy, r0.w, c255, r0
					    mov o1.zw, r0
					
					// approximately 8 instruction slots used"
				}
				SubProgram "d3d11 " {
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					void main()
					{
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d9 " {
					"ps_3_0
					
					//
					// Generated by Microsoft (R) HLSL Shader Compiler 10.1
					//
					// Parameters:
					//
					//   sampler2D _MainTex;
					//   float _TimeX;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _TimeX       c0       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c1, 0.100000001, 10, -0.5, 0
					    def c2, 1.41421354, 0.795774698, 0.5, 0
					    def c3, 6.28318548, -3.14159274, 0.0625, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mov r0.x, c1.x
					    mul r0.x, r0.x, c0.x
					    frc r0.x, r0_abs.x
					    cmp r0.x, c0.x, r0.x, -r0.x
					    mul r0.x, r0.x, c1.y
					    add r0.yz, c1.z, v0.xxyw
					    dp2add r0.w, r0.yzzw, r0.yzzw, c1.w
					    rsq r0.w, r0.w
					    rcp r0.w, r0.w
					    add r0.w, -r0.w, -c1.z
					    mul r0.w, r0.w, c2.x
					    rsq r0.w, r0.w
					    rcp r0.w, r0.w
					    mul r0.x, r0.x, r0.w
					    mad r0.x, r0.x, c2.y, c2.z
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c3.x, c3.y
					    sincos r1.x, r0.x
					    mul r0.x, r0.z, r1.x
					    mad r0.x, r0.y, r1.x, -r0.x
					    cmp r0.x, r0.x, c3.z, c3.w
					    add r0.xy, r0.x, v0
					    texld oC0, r0, s0
					
					// approximately 31 instruction slots used (1 texture, 30 arithmetic)"
				}
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						float _TimeX;
						vec4 unused_0_2;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					bool u_xlatb1;
					float u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.100000001;
					    u_xlatb1 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb1) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat3 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat3 = sqrt(u_xlat3);
					    u_xlat0.w = (-u_xlat3) + 0.5;
					    u_xlat0.xw = u_xlat0.xw * vec2(10.0, 1.41421354);
					    u_xlat3 = inversesqrt(u_xlat0.w);
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat2 = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat1.x * u_xlat0.x + (-u_xlat2);
					    u_xlatb0 = u_xlat0.x>=0.0;
					    u_xlat0.x = u_xlatb0 ? 0.0625 : float(0.0);
					    u_xlat0.xy = u_xlat0.xx + vs_TEXCOORD0.xy;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
					    return;
					}"
				}
			}
		}
	}
}