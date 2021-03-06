Shader "CameraFilterPack/Drawing_Halftone" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_DotSize ("_DotSize", Range(1, 16)) = 10
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 63974
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
					//   float _Distortion;
					//   float _DotSize;
					//   sampler2D _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Distortion  c0       1
					//   _DotSize     c1       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c2, 2136.28125, 0.707106411, 0.159154937, 0.5
					    def c3, 6.28318548, -3.14159274, 0.25, 0.5
					    def c4, 0.212500006, 0.715399981, 0.0720999986, 1
					    dcl_texcoord_pp v0.xy
					    dcl_2d s0
					    rcp r0.x, c1.x
					    mul r0.x, r0.x, c2.x
					    mul r0.yz, c2.y, v0.xxyw
					    add r0.y, r0.z, r0.y
					    mad r0.z, v0.x, c2.y, -r0.z
					    mul r0.z, r0.x, r0.z
					    mul r0.x, r0.x, r0.y
					    mad r0.x, r0.x, c2.z, c2.w
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c3.x, c3.y
					    sincos r1.x, r0.x
					    mad r0.x, r1.x, c3.z, c3.w
					    mad r0.y, r0.z, c2.z, c2.w
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c3.x, c3.y
					    sincos r1.x, r0.y
					    mad_pp r0.x, r1.x, c3.z, r0.x
					    texld_pp r1, v0, s0
					    dp3_pp r0.y, r1, c4
					    mad_pp r0.x, r0.x, c0.x, r0.y
					    mov r0.w, c4.w
					    add_pp r0.xy, r0.xwzw, -c0.x
					    rcp r0.y, r0.y
					    mul_pp oC0.xyz, r0.y, r0.x
					    mov_pp oC0.w, c4.w
					
					// approximately 39 instruction slots used (1 texture, 38 arithmetic)"
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
						float _Distortion;
						float _DotSize;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlat0.y = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat0.y);
					    u_xlat4 = 2136.28125 / _DotSize;
					    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy;
					    u_xlat0.xy = cos(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * 0.25 + 0.5;
					    u_xlat0.x = u_xlat0.y * 0.25 + u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = dot(u_xlat1.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
					    u_xlat0.x = u_xlat0.x * _Distortion + u_xlat2;
					    u_xlat0.x = u_xlat0.x + (-_Distortion);
					    u_xlat2 = (-_Distortion) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx / vec3(u_xlat2);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}