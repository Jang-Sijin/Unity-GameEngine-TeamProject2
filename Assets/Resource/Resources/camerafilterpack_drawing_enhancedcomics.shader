Shader "CameraFilterPack/Drawing_EnhancedComics" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_DotSize ("_DotSize", Range(0, 1)) = 0
		_ColorRGB ("_ColorRGB", Vector) = (1,0,0,1)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 17251
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
				SubProgram "d3d11_9x " {
					"vs_4_0_level_9_1
					
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
					//   float _Blood;
					//   float _ColorB;
					//   float _ColorG;
					//   float _ColorR;
					//   float4 _ColorRGB;
					//   float _DotSize;
					//   sampler2D _MainTex;
					//   float _SmoothEnd;
					//   float _SmoothStart;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _ColorRGB    c0       1
					//   _DotSize     c1       1
					//   _ColorR      c2       1
					//   _ColorG      c3       1
					//   _ColorB      c4       1
					//   _Blood       c5       1
					//   _SmoothStart c6       1
					//   _SmoothEnd   c7       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c8, 0.100000001, 0.333333343, -2, 3
					    def c9, 0, 1, 8.88000011, 8.39000034
					    dcl_texcoord_pp v0.xy
					    dcl_2d s0
					    mov r0.x, c1.x
					    add r0.y, r0.x, c7.x
					    add r0.y, r0.y, c8.x
					    add r0.x, r0.x, c6.x
					    add r0.y, -r0.x, r0.y
					    rcp r0.y, r0.y
					    texld r1, v0, s0
					    add r0.z, r1.y, r1.x
					    add r0.z, r1.z, r0.z
					    mad r0.x, r0.z, c8.y, -r0.x
					    mul_sat r0.x, r0.y, r0.x
					    mad r0.y, r0.x, c8.z, c8.w
					    mul r0.x, r0.x, r0.x
					    mul r0.x, r0.x, r0.y
					    mov r2.xy, c9
					    mad r0.yzw, c5.x, r2.xxyy, r2.xyxx
					    mad r1.xyz, r1, c9.z, -r0.yzww
					    mad r0.yzw, r1.xxyz, c9.w, r0
					    add r0.w, r0.w, -c4.x
					    cmp r0.w, r0.w, -c9.x, -c9.y
					    add r0.z, r0.z, -c3.x
					    add r0.y, -r0.y, c2.x
					    cmp r0.z, r0.z, c9.x, r0.w
					    cmp r0.y, r0.y, c9.x, r0.z
					    cmp oC0.xyz, r0.y, r0.x, c0
					    mov oC0.w, c9.y
					
					// approximately 26 instruction slots used (1 texture, 25 arithmetic)"
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
						vec4 unused_0_0[4];
						vec4 _ColorRGB;
						float _DotSize;
						float _ColorR;
						float _ColorG;
						float _ColorB;
						float _Blood;
						float _SmoothStart;
						float _SmoothEnd;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vec2(_DotSize) + vec2(_SmoothStart, _SmoothEnd);
					    u_xlat3.x = u_xlat0.y + 0.100000001;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat6 = u_xlat1.y + u_xlat1.x;
					    u_xlat6 = u_xlat1.z + u_xlat6;
					    u_xlat0.x = u_xlat6 * 0.333333343 + (-u_xlat0.x);
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat2.x = 1.0;
					    u_xlat2.yz = vec2(_Blood);
					    u_xlat3.xyz = u_xlat1.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + (-u_xlat2.xzz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + u_xlat2.xyz;
					    u_xlatb3 = _ColorR<u_xlat3.x;
					    u_xlatb6.xy = lessThan(u_xlat3.yzyz, vec4(_ColorG, _ColorB, _ColorG, _ColorB)).xy;
					    u_xlatb3 = u_xlatb6.x && u_xlatb3;
					    u_xlatb3 = u_xlatb6.y && u_xlatb3;
					    SV_Target0.xyz = (bool(u_xlatb3)) ? _ColorRGB.xyz : u_xlat0.xxx;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					"ps_4_0_level_9_1
					
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
						vec4 unused_0_0[4];
						vec4 _ColorRGB;
						float _DotSize;
						float _ColorR;
						float _ColorG;
						float _ColorB;
						float _Blood;
						float _SmoothStart;
						float _SmoothEnd;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					bvec2 u_xlatb6;
					void main()
					{
					    u_xlat0.xy = vec2(_DotSize) + vec2(_SmoothStart, _SmoothEnd);
					    u_xlat3.x = u_xlat0.y + 0.100000001;
					    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat3.x = float(1.0) / u_xlat3.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat6 = u_xlat1.y + u_xlat1.x;
					    u_xlat6 = u_xlat1.z + u_xlat6;
					    u_xlat0.x = u_xlat6 * 0.333333343 + (-u_xlat0.x);
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat3.x;
					    u_xlat2.x = 1.0;
					    u_xlat2.yz = vec2(_Blood);
					    u_xlat3.xyz = u_xlat1.xyz * vec3(8.88000011, 8.88000011, 8.88000011) + (-u_xlat2.xzz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(8.39000034, 8.39000034, 8.39000034) + u_xlat2.xyz;
					    u_xlatb3 = _ColorR<u_xlat3.x;
					    u_xlatb6.xy = lessThan(u_xlat3.yzyz, vec4(_ColorG, _ColorB, _ColorG, _ColorB)).xy;
					    u_xlatb3 = u_xlatb6.x && u_xlatb3;
					    u_xlatb3 = u_xlatb6.y && u_xlatb3;
					    SV_Target0.xyz = (bool(u_xlatb3)) ? _ColorRGB.xyz : u_xlat0.xxx;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}