Shader "CameraFilterPack/Distortion_Wave_Horizontal" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_WaveIntensity ("_WaveIntensity", Range(1, 100)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 64480
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
					//   float _WaveIntensity;
					//
					//
					// Registers:
					//
					//   Name           Reg   Size
					//   -------------- ----- ----
					//   _TimeX         c0       1
					//   _WaveIntensity c1       1
					//   _MainTex       s0       1
					//
					
					    ps_3_0
					    def c2, 0.0700000003, 0.100000001, 0.159154937, 0.5
					    def c3, 0.00899999961, 0, 0, 0
					    def c4, 6.28318548, -3.14159274, -10, 0.00499999989
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mov r0.z, c4.z
					    add r0.x, r0.z, c1.x
					    mov r1.xy, c2
					    mad r0.yz, c0.x, r1.xxyw, v0.y
					    mul r0.x, r0.x, r0.z
					    mul r0.y, r0.y, c1.x
					    mad r0.y, r0.y, c2.z, c2.w
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c4.x, c4.y
					    sincos r1.y, r0.y
					    mad r0.x, r0.x, c2.z, c2.w
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c4.x, c4.y
					    sincos r2.y, r0.x
					    mul r0.x, r2.y, c4.w
					    mad r0.x, r1.y, c3.x, r0.x
					    add r0.x, r0.x, v0.x
					    mov r0.y, v0.y
					    texld oC0, r0, s0
					
					// approximately 33 instruction slots used (1 texture, 32 arithmetic)"
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
						float _WaveIntensity;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					void main()
					{
					    u_xlat0.x = _WaveIntensity + -10.0;
					    u_xlat1.xy = vec2(_TimeX) * vec2(0.0700000003, 0.100000001) + vs_TEXCOORD0.yy;
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.y = u_xlat1.x * _WaveIntensity;
					    u_xlat0.xy = sin(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * 0.00499999989;
					    u_xlat0.x = u_xlat0.y * 0.00899999961 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + vs_TEXCOORD0.x;
					    u_xlat0.y = vs_TEXCOORD0.y;
					    SV_Target0 = texture(_MainTex, u_xlat0.xy);
					    return;
					}"
				}
			}
		}
	}
}