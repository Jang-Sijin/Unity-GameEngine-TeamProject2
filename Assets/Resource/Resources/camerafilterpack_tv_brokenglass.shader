Shader "CameraFilterPack/TV_BrokenGlass" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 29147
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
					//   sampler2D _MainTex2;
					//   float2 _MainTex_TexelSize;
					//   float _Value;
					//   float _Value2;
					//   float _Value3;
					//   float _Value4;
					//   float _Value5;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   _Value             c0       1
					//   _Value2            c1       1
					//   _Value3            c2       1
					//   _Value4            c3       1
					//   _Value5            c4       1
					//   _MainTex_TexelSize c5       1
					//   _MainTex           s0       1
					//   _MainTex2          s1       1
					//
					
					    ps_3_0
					    def c6, 1, 0.5, 0, 0.001953125
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    dcl_2d s1
					    add r0.x, c6.x, -v0.y
					    cmp r0.y, c5.y, v0.y, r0.x
					    mov r0.x, v0.x
					    mul r0.zw, r0.xyxy, c6.y
					    texld r1, r0.zwzw, s1
					    mad r2, r0.xyxy, c6.y, c6.yzyy
					    mad r0.xy, r0, c6.y, c6.zyzw
					    texld r0, r0, s1
					    texld r3, r2, s1
					    texld r2, r2.zwzw, s1
					    mul r3.xyz, r3, c2.x
					    mad r1.xyz, r1, c3.x, r3
					    mad r1.xyz, r2, c4.x, r1
					    mad r0.xyz, r0, c1.x, r1
					    mad r1.xy, r0.x, c6.w, v0
					    texld r1, r1, s0
					    mad_pp oC0.xyz, r0, c0.x, r1
					    mov_pp oC0.w, c6.x
					
					// approximately 18 instruction slots used (5 texture, 13 arithmetic)"
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
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						float _Value5;
						vec4 unused_0_6;
						vec2 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat4 = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat0.y = (u_xlatb0) ? u_xlat4 : vs_TEXCOORD0.y;
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat1 = texture(_MainTex2, u_xlat8.xy);
					    u_xlat2 = u_xlat0.xyxy * vec4(0.5, 0.5, 0.5, 0.5) + vec4(0.5, 0.0, 0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.0, 0.5);
					    u_xlat0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat3 = texture(_MainTex2, u_xlat2.xy);
					    u_xlat2 = texture(_MainTex2, u_xlat2.zw);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(_Value3);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Value4, _Value4, _Value4)) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(vec3(_Value5, _Value5, _Value5)) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Value2, _Value2, _Value2)) + u_xlat1.xyz;
					    u_xlat1.xy = u_xlat0.xx * vec2(0.001953125, 0.001953125) + vs_TEXCOORD0.xy;
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(vec3(_Value, _Value, _Value)) + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}