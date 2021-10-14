Shader "CameraFilterPack/EyesVision_1" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 58712
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
					//   float _TimeX;
					//   float _Value;
					//   float _Value2;
					//   float _Value3;
					//   float _Value4;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   _TimeX             c0       1
					//   _Value             c1       1
					//   _Value2            c2       1
					//   _Value3            c3       1
					//   _Value4            c4       1
					//   _MainTex_TexelSize c5       1
					//   _MainTex           s0       1
					//   _MainTex2          s1       1
					//
					
					    ps_3_0
					    def c6, 0, 1, 12.9898005, 78.2330017
					    def c7, 43758.5469, 23, -0.0240000002, 0.0160000008
					    def c8, 0.800000012, 0.075000003, 0.0500000007, 0.0199999996
					    def c9, 0.159154937, 0.5, 6.28318548, -3.14159274
					    def c10, 0.5, 1, 0.125, 0.0795774683
					    def c11, 0.0799999982, -0.0299999993, -1.66666663, 0
					    def c12, -2, 3, 0, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    dcl_2d s1
					    mov r0.x, c0.x
					    mul r0.y, r0.x, c3.x
					    frc r0.z, r0.y
					    cmp r0.w, -r0.z, c6.x, c6.y
					    add r0.z, r0.y, -r0.z
					    cmp r0.y, r0.y, c6.x, r0.w
					    add r0.y, r0.y, r0.z
					    add r0.y, r0.y, r0.y
					    add r0.z, r0.y, c7.y
					    dp2add r0.z, r0.z, c6.zwzw, c6.x
					    mad r0.z, r0.z, c9.x, c9.y
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c9.z, c9.w
					    sincos r1.y, r0.z
					    mul r0.z, r1.y, c7.x
					    frc r1.y, r0.z
					    dp2add r0.z, r0.y, c6.zwzw, c6.x
					    mad r0.z, r0.z, c9.x, c9.y
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c9.z, c9.w
					    sincos r2.y, r0.z
					    mul r0.z, r2.y, c7.x
					    frc r1.x, r0.z
					    mad r0.zw, r1.xyxy, c7, v0.xyxy
					    mad r0.zw, r0, c8.x, c8.xyyz
					    add r1.xy, c6.y, -v0
					    cmp r1.xy, c5.y, v0, r1
					    mul r1.xy, r1, c1.x
					    mad r1.xy, c2.x, r0.x, r1
					    mad r1.xy, r1, c9.x, c9.y
					    frc r1.xy, r1
					    mad r1.xy, r1, c9.z, c9.w
					    sincos r2.x, r1.y
					    sincos r3.y, r1.x
					    mad r1.x, r3.y, c10.x, c10.y
					    mad r1.y, r2.x, c10.x, c10.y
					    sincos r2.y, r1.y
					    add r2.x, r1.x, r2.y
					    sincos r3.x, r1.x
					    add r2.y, r1.y, r3.x
					    mad r0.zw, r2.xyxy, c8.w, r0
					    texld r1, r0.zwzw, s1
					    mad r0.zw, r1.xyxy, c10.z, v0.xyxy
					    add r1.w, -r0.w, c9.y
					    texld r2, r0.zwzw, s0
					    add r1.xyz, r1, r2
					    add r1.xyz, r1, c11.xxyw
					    dp2add r0.z, r1.w, r1.w, c6.x
					    rsq r0.z, r0.z
					    rcp r0.z, r0.z
					    mad r0.x, r0.x, c10.w, c10.x
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c9.z, c9.w
					    sincos r2.y, r0.x
					    mul r0.x, r2.y, r2.y
					    mad r0.x, r0.x, -r0.y, r0.y
					    add r0.x, -r0.x, r0.z
					    mul_sat r0.x, r0.x, c11.z
					    mad r0.y, r0.x, c12.x, c12.y
					    mul r0.x, r0.x, r0.x
					    mad r0.x, r0.y, -r0.x, c6.y
					    mul r0.x, r0.x, c4.x
					    mad_pp oC0.xyz, r0.x, -r1, r1
					    mov_pp oC0.w, c6.y
					
					// approximately 116 instruction slots used (2 texture, 114 arithmetic)"
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
						float _Value4;
						vec4 unused_0_6;
						vec2 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat4;
					float u_xlat6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0 = _TimeX * _Value3;
					    u_xlat0 = trunc(u_xlat0);
					    u_xlat3.x = u_xlat0 * 2.0 + 23.0;
					    u_xlat0 = u_xlat0 + u_xlat0;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat3.x);
					    u_xlat3.x = dot(vec2(u_xlat0), vec2(12.9898005, 78.2330017));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat3.x = u_xlat3.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat3.x);
					    u_xlat3.xy = u_xlat1.xy * vec2(-0.0240000002, 0.0160000008) + vs_TEXCOORD0.xy;
					    u_xlat3.xy = u_xlat3.xy * vec2(0.800000012, 0.800000012) + vec2(0.075000003, 0.0500000007);
					    u_xlatb9 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat1.xy = (bool(u_xlatb9)) ? u_xlat1.xy : vs_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Value, _Value));
					    u_xlat1.xy = vec2(vec2(_Value2, _Value2)) * vec2(_TimeX) + u_xlat1.xy;
					    u_xlat9 = cos(u_xlat1.y);
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.5 + 1.0;
					    u_xlat9 = u_xlat9 * 0.5 + 1.0;
					    u_xlat4 = sin(u_xlat9);
					    u_xlat2.x = u_xlat4 + u_xlat1.x;
					    u_xlat1.x = cos(u_xlat1.x);
					    u_xlat2.y = u_xlat9 + u_xlat1.x;
					    u_xlat3.xy = u_xlat2.xy * vec2(0.0199999996, 0.0199999996) + u_xlat3.xy;
					    u_xlat1 = texture(_MainTex2, u_xlat3.xy);
					    u_xlat3.xy = u_xlat1.xy * vec2(0.125, 0.125) + vs_TEXCOORD0.xy;
					    u_xlat9 = (-u_xlat3.y) + 0.5;
					    u_xlat2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + vec3(0.0799999982, 0.0799999982, -0.0299999993);
					    u_xlat3.x = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat3.x = sqrt(u_xlat3.x);
					    u_xlat6 = _TimeX * 0.5;
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat0 = (-u_xlat6) * u_xlat0 + u_xlat0;
					    u_xlat0 = (-u_xlat0) + u_xlat3.x;
					    u_xlat0 = u_xlat0 * -1.66666663;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat0 = (-u_xlat3.x) * u_xlat0 + 1.0;
					    u_xlat0 = u_xlat0 * _Value4;
					    SV_Target0.xyz = vec3(u_xlat0) * (-u_xlat1.xyz) + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}