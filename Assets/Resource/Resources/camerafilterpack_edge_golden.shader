Shader "CameraFilterPack/Edge_Golden" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 60007
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
					//   float4 _ScreenResolution;
					//
					//
					// Registers:
					//
					//   Name              Reg   Size
					//   ----------------- ----- ----
					//   _ScreenResolution c0       1
					//   _MainTex          s0       1
					//
					
					    ps_3_0
					    def c1, -1.5, 1.5, 0.333332986, 1
					    def c2, 0.100000001, 0.180000007, 0.300000012, 0
					    def c3, 4.5, 1.80000007, -1.50000012, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    rcp r0.x, c0.x
					    rcp r0.y, c0.y
					    mad r1, r0.xyxy, c1.xxyx, v0.xyxy
					    mad r0, r0.xyxy, c1.xyyy, v0.xyxy
					    texld r2, r1, s0
					    texld r1, r1.zwzw, s0
					    dp3 r1.x, r1, c1.z
					    dp3 r1.y, r2, c1.z
					    texld r2, r0.zwzw, s0
					    texld r0, r0, s0
					    dp3 r0.x, r0, c1.z
					    dp3 r0.y, r2, c1.z
					    add r0.xy, -r0, r1
					    max r1.x, r0_abs.y, r0_abs.x
					    rsq r0.x, r1.x
					    rcp r0.x, r0.x
					    mov r1.xyz, c3
					    mad oC0.xyz, r0.x, r1, c2
					    mov oC0.w, c1.w
					
					// approximately 19 instruction slots used (4 texture, 15 arithmetic)"
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / _ScreenResolution.xyxy;
					    u_xlat1 = u_xlat0.zwzw * vec4(-1.5, -1.5, 1.5, -1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat0 = u_xlat0 * vec4(-1.5, 1.5, 1.5, 1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1.x = dot(u_xlat1.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat1.y = dot(u_xlat2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat2 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.y = dot(u_xlat2.xyz, vec3(0.333332986, 0.333332986, 0.333332986));
					    u_xlat0.xy = (-u_xlat0.xy) + u_xlat1.xy;
					    u_xlat0.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    SV_Target0.xyz = u_xlat0.xxx * vec3(4.5, 1.80000007, -1.50000012) + vec3(0.100000001, 0.180000007, 0.300000012);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}