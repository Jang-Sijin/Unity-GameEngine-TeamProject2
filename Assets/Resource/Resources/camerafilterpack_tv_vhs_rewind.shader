Shader "CameraFilterPack/TV_VHS_Rewind" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 4514
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
					//   float _Value;
					//   float _Value2;
					//   float _Value3;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _TimeX       c0       1
					//   _Value       c1       1
					//   _Value2      c2       1
					//   _Value3      c3       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c4, 6.28318548, -3.14159274, 0.100000001, 0.899999976
					    def c5, 0, 10, 1, 0.0199999996
					    def c6, -0.5, 0.0318309888, 0.5, -0.0500000007
					    def c7, -4, 2, 0.0189999994, -0.0189999994
					    def c8, 15.915494, 10, 0.5, -0.5
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mov r0.x, c0.x
					    mul r0.y, -r0.x, c3.x
					    frc r0.y, r0.y
					    mad r0.y, v0.y, c1.x, -r0.y
					    add r0.y, r0.y, c6.w
					    max r1.x, r0.y, c5.x
					    add r0.y, r1.x, -c4.z
					    mul r0.z, r1.x, c5.y
					    cmp r0.y, r0.y, c5.z, r0.z
					    mul r0.z, -r0.x, c2.x
					    frc r0.z, r0.z
					    mad r0.z, v0.y, c1.x, -r0.z
					    add r0.z, r0.z, c6.w
					    max r1.x, r0.z, c5.x
					    min r0.z, r1.x, c4.z
					    mad r1.xy, r0.z, c8, c8.zwzw
					    mul r0.z, r0.z, c5.y
					    frc r0.w, r1.x
					    mad r1.x, r1.y, c7.x, c7.y
					    mad r0.w, r0.w, c4.x, c4.y
					    sincos r2.y, r0.w
					    mul r0.w, r1.x, r2.y
					    mul r1.x, r0.w, c5.w
					    mov r1.y, c5.x
					    add r1.xy, r1, v0
					    add r0.w, -r1.y, c5.z
					    mul r0.yz, r0.w, r0
					    mad r0.x, r0.x, c6.y, c6.z
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c4.x, c4.y
					    sincos r2.y, r0.x
					    mad r0.x, r2.y, c4.z, c4.w
					    add r0.w, c6.x, v0.x
					    mul r0.x, r0.x, r0.w
					    mul r0.x, r0_abs.x, c1.x
					    mad r2.xy, r0.x, c7.zwzw, r1.x
					    texld r1, r1, s0
					    mov r2.z, v0.y
					    texld r3, r2.yzzw, s0
					    texld r2, r2.xzzw, s0
					    mov r1.z, r3.z
					    mov r1.x, r2.x
					    lrp r2.xyz, r0.y, r1.x, r1
					    add r0.xyw, -r2.xyzz, r2.x
					    mad_pp oC0.xyz, r0.z, r0.xyww, r2
					    mov_pp oC0.w, c5.z
					
					// approximately 60 instruction slots used (3 texture, 57 arithmetic)"
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
						float _Value;
						float _Value2;
						float _Value3;
						vec4 unused_0_5;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _TimeX * 0.200000003;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.100000001 + 0.899999976;
					    u_xlat4.x = vs_TEXCOORD0.x + -0.5;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat0.x = abs(u_xlat0.x) * _Value;
					    u_xlat4.xyz = vec3(_Value3, _Value2, _Value2) * (-vec3(_TimeX));
					    u_xlat4.xyz = fract(u_xlat4.xyz);
					    u_xlat4.xyz = vs_TEXCOORD0.yyy * vec3(vec3(_Value, _Value, _Value)) + (-u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz + vec3(-0.0500000007, -0.0500000007, -0.0500000007);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = min(u_xlat4.xyz, vec3(0.100000001, 0.100000001, 0.100000001));
					    u_xlat1.x = u_xlat4.y * 10.0 + -0.5;
					    u_xlat4.xyz = u_xlat4.xyz * vec3(10.0, 10.0, 100.0);
					    u_xlat1.x = u_xlat1.x * -4.0 + 2.0;
					    u_xlat12 = sin(u_xlat4.z);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat1.x = u_xlat12 * 0.0199999996;
					    u_xlat1.y = 0.0;
					    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
					    u_xlat2.xy = u_xlat0.xx * vec2(0.0189999994, -0.0189999994) + u_xlat1.xx;
					    u_xlat2.z = vs_TEXCOORD0.y;
					    u_xlat3 = texture(_MainTex, u_xlat2.yz);
					    u_xlat2 = texture(_MainTex, u_xlat2.xz);
					    u_xlat2.z = u_xlat3.z;
					    u_xlat3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.x = (-u_xlat1.y) + 1.0;
					    u_xlat0.xy = u_xlat0.xx * u_xlat4.xy;
					    u_xlat2.y = u_xlat3.y;
					    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat2.xxx;
					    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat0.xxx;
					    SV_Target0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}