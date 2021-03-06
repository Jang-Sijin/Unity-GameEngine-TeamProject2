Shader "CameraFilterPack/Blend2Camera_SplitScreen" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 8400
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
					//   float _Value6;
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
					//   _Value6            c5       1
					//   _MainTex_TexelSize c6       1
					//   _MainTex           s0       1
					//   _MainTex2          s1       1
					//
					
					    ps_3_0
					    def c7, 1, 0.159154937, 0.5, 0
					    def c8, 6.28318548, -3.14159274, -2, 3
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    dcl_2d s1
					    add r0.x, c7.x, -v0.y
					    cmp r0.y, c6.y, v0.y, r0.x
					    mov r1.x, -c2.x
					    mov r1.y, -c5.x
					    mov r0.x, v0.x
					    add r0.xy, r0, r1
					    mov r1.xyz, c7
					    mad r0.z, c4.x, r1.y, r1.z
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c8.x, c8.y
					    sincos r2.xy, r0.z
					    dp2add r0.z, r0, r2.yxzw, c7.w
					    dp2add r0.x, r0, -r2.yxzw, c7.x
					    cmp r0.x, c6.y, r0.z, r0.x
					    cmp r0.x, r0.x, -r0.x, -c7.w
					    dp2add r0.x, r0.x, r0.x, c7.w
					    rsq r0.x, r0.x
					    rcp r0.x, r0.x
					    rcp r0.y, c3.x
					    mul_sat r0.x, r0.y, r0.x
					    mad r0.y, r0.x, c8.z, c8.w
					    mul r0.x, r0.x, r0.x
					    mad r0.x, r0.y, -r0.x, c7.x
					    mul r0.x, r0.x, c0.x
					    add r0.y, r1.x, -c1.x
					    texld r1, v0, s1
					    texld r2, v0, s0
					    add r3.xyz, r1, -r2
					    lrp r4.xyz, c1.x, r1, r2
					    mad r0.yzw, r0.y, r3.xxyz, r2.xxyz
					    add r0.yzw, -r4.xxyz, r0
					    mad oC0.xyz, r0.x, r0.yzww, r4
					    mov oC0.w, c7.x
					
					// approximately 43 instruction slots used (2 texture, 41 arithmetic)"
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
						float _Value6;
						vec2 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb3;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlatb3 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.y = (u_xlatb3) ? u_xlat0.x : vs_TEXCOORD0.y;
					    u_xlat2.y = (-_Value6);
					    u_xlat1.x = vs_TEXCOORD0.x;
					    u_xlat2.xz = (-vec2(_Value3, _Value2));
					    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
					    u_xlat9 = u_xlat2.z + 1.0;
					    u_xlat1.x = sin(_Value5);
					    u_xlat2.x = cos(_Value5);
					    u_xlat6 = u_xlat0.z * u_xlat2.x;
					    u_xlat0.x = u_xlat0.x * u_xlat1.x + u_xlat6;
					    u_xlat6 = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = (u_xlatb3) ? u_xlat6 : u_xlat0.x;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = dot((-u_xlat0.xx), (-u_xlat0.xx));
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat3.x = float(1.0) / _Value4;
					    u_xlat0.x = u_xlat3.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
					    u_xlat0.x = u_xlat0.x * _Value;
					    u_xlat1 = texture(_MainTex2, vs_TEXCOORD0.xy);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz + (-u_xlat2.xyz);
					    u_xlat3.xyz = vec3(u_xlat9) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}