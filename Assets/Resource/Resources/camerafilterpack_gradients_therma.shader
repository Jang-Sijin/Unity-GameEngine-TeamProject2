Shader "CameraFilterPack/Gradients_Therma" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 12326
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
					//   float _Value;
					//   float _Value2;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Value       c0       1
					//   _Value2      c1       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c2, -2, 1, 0.800000012, 0.200000003
					    def c3, 2.85714293, 0.5, -2, 3
					    def c4, 1.70000005, 1, 7, -6
					    def c5, 0.212599993, 0.715200007, 0.0722000003, 1.5
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    texld r0, v0, s0
					    dp3 r0.w, r0, c5
					    mad r1.x, r0.w, c2.x, c2.y
					    mad r0.w, c0.x, r1.x, r0.w
					    mul r1.xy, r0.w, c3
					    mov_sat r1.x, r1.x
					    mad r1.z, r1.x, c3.z, c3.w
					    mul r1.x, r1.x, r1.x
					    mad r1.x, r1.z, r1.x, r1.y
					    add r1.w, r0.w, -c3.y
					    add_sat r1.w, r1.w, r1.w
					    mad r2.x, r1.w, c3.z, c3.w
					    mul r1.w, r1.w, r1.w
					    mul r1.y, r1.w, r2.x
					    mad r2.x, r0.w, -c4.x, c4.y
					    mad r2.y, r0.w, c4.z, c4.w
					    pow r1.w, r0.w, c5.w
					    mad r0.w, r1.w, c2.z, c2.w
					    max r1.z, r2.x, r2.y
					    mul_sat r1.xyz, r0.w, r1
					    add r1.xyz, -r0, r1
					    mad oC0.xyz, c1.x, r1, r0
					    mov oC0.w, c2.y
					
					// approximately 25 instruction slots used (1 texture, 24 arithmetic)"
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
						vec4 unused_0_3;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					float u_xlat2;
					float u_xlat7;
					float u_xlat9;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat9 = dot(u_xlat0.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
					    u_xlat1.x = u_xlat9 * -2.0 + 1.0;
					    u_xlat9 = _Value * u_xlat1.x + u_xlat9;
					    u_xlat1.xy = vec2(u_xlat9) * vec2(2.85714293, 0.5);
					    u_xlat1.x = u_xlat1.x;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat7 = u_xlat1.x * -2.0 + 3.0;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat7 * u_xlat1.x + u_xlat1.y;
					    u_xlat10 = u_xlat9 + -0.5;
					    u_xlat10 = u_xlat10 + u_xlat10;
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2 = u_xlat10 * -2.0 + 3.0;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat1.y = u_xlat10 * u_xlat2;
					    u_xlat10 = (-u_xlat9) * 1.70000005 + 1.0;
					    u_xlat2 = u_xlat9 * 7.0 + -6.0;
					    u_xlat9 = log2(u_xlat9);
					    u_xlat9 = u_xlat9 * 1.5;
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat9 = u_xlat9 * 0.800000012 + 0.200000003;
					    u_xlat1.z = max(u_xlat10, u_xlat2);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}