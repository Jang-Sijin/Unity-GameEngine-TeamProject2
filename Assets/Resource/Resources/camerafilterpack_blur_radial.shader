Shader "CameraFilterPack/Blur_Radial" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 63666
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
					//   float _Value3;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Value       c0       1
					//   _Value2      c1       1
					//   _Value3      c2       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c3, 0.075000003, 0.150000006, 0.225000009, 0.300000012
					    def c4, 1, 0.975000024, 1.05000007, 1.125
					    def c5, 0.0625, 0, 0, 0
					    def c6, 0.675000012, 0.75, 0.825000048, 0.900000036
					    def c7, 0.375, 0.450000018, 0.525000036, 0.600000024
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    texld r0, v0, s0
					    mov r1, c4
					    mov r2.x, c0.x
					    mad r3, r2.x, c3, r1.x
					    mov r4.x, c1.x
					    mov r4.y, c2.x
					    lrp r5, r3.xxyy, v0.xyxy, r4.xyxy
					    lrp r6, r3.zzww, v0.xyxy, r4.xyxy
					    texld r3, r5, s0
					    texld r5, r5.zwzw, s0
					    add r0, r0, r3
					    add r0, r5, r0
					    texld r3, r6, s0
					    texld r5, r6.zwzw, s0
					    add r0, r0, r3
					    add r0, r5, r0
					    mad r3, r2.x, c7, r1.x
					    lrp r5, r3.xxyy, v0.xyxy, r4.xyxy
					    lrp r6, r3.zzww, v0.xyxy, r4.xyxy
					    texld r3, r5, s0
					    texld r5, r5.zwzw, s0
					    add r0, r0, r3
					    add r0, r5, r0
					    texld r3, r6, s0
					    texld r5, r6.zwzw, s0
					    add r0, r0, r3
					    add r0, r5, r0
					    mad r2, r2.x, c6, r1.x
					    lrp r3, r2.xxyy, v0.xyxy, r4.xyxy
					    lrp r5, r2.zzww, v0.xyxy, r4.xyxy
					    texld r2, r3, s0
					    texld r3, r3.zwzw, s0
					    add r0, r0, r2
					    add r0, r3, r0
					    texld r2, r5, s0
					    texld r3, r5.zwzw, s0
					    add r0, r0, r2
					    add r0, r3, r0
					    mad r1.xyz, c0.x, r1.yzww, r1.x
					    lrp r2, r1.xxyy, v0.xyxy, r4.xyxy
					    lrp r3.xy, r1.z, v0, r4
					    texld r1, r3, s0
					    texld r3, r2, s0
					    texld r2, r2.zwzw, s0
					    add r0, r0, r3
					    add r0, r2, r0
					    add r0, r1, r0
					    mul oC0, r0, c5.x
					
					// approximately 48 instruction slots used (16 texture, 32 arithmetic)"
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
						vec4 unused_0_4;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.075000003, 0.150000006, 0.225000009, 0.300000012) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2.xy = vs_TEXCOORD0.xy + (-vec2(_Value2, _Value3));
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat0 = u_xlat0 + u_xlat4;
					    u_xlat0 = u_xlat3 + u_xlat0;
					    u_xlat3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0 = u_xlat0 + u_xlat3;
					    u_xlat0 = u_xlat1 + u_xlat0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.375, 0.450000018, 0.525000036, 0.600000024) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat0 = u_xlat0 + u_xlat4;
					    u_xlat0 = u_xlat3 + u_xlat0;
					    u_xlat3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0 = u_xlat0 + u_xlat3;
					    u_xlat0 = u_xlat1 + u_xlat0;
					    u_xlat1 = vec4(vec4(_Value, _Value, _Value, _Value)) * vec4(0.675000012, 0.75, 0.825000048, 0.900000036) + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1 = u_xlat2.xyxy * u_xlat1.zzww + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat0 = u_xlat0 + u_xlat4;
					    u_xlat0 = u_xlat3 + u_xlat0;
					    u_xlat3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0 = u_xlat0 + u_xlat3;
					    u_xlat0 = u_xlat1 + u_xlat0;
					    u_xlat1.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.975000024, 1.05000007, 1.125) + vec3(1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxy * u_xlat1.xxyy + vec4(_Value2, _Value3, _Value2, _Value3);
					    u_xlat1.xy = u_xlat2.xy * u_xlat1.zz + vec2(_Value2, _Value3);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat0 = u_xlat0 + u_xlat2;
					    u_xlat0 = u_xlat3 + u_xlat0;
					    u_xlat0 = u_xlat1 + u_xlat0;
					    SV_Target0 = u_xlat0 * vec4(0.0625, 0.0625, 0.0625, 0.0625);
					    return;
					}"
				}
			}
		}
	}
}