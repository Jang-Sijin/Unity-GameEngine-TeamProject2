Shader "CameraFilterPack/TV_50" {
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
			GpuProgramID 27916
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
					//   float _TimeX;
					//
					//
					// Registers:
					//
					//   Name              Reg   Size
					//   ----------------- ----- ----
					//   _TimeX            c0       1
					//   _ScreenResolution c1       1
					//   _MainTex          s0       1
					//
					
					    ps_3_0
					    def c2, -0.5, 2.20000005, 0.200000003, 1
					    def c3, 0.300000012, 0.699999988, 0.159154937, 0.5
					    def c4, 0.25, 0.920000017, 0.0399999991, 0.0409999974
					    def c5, 3.5, 21, 29, 250
					    def c6, 31, 0.00170000002, 0.00100000005, 0.0500000007
					    def c7, 0.00170000002, 0.0250000004, 0.75, 0.400000006
					    def c8, 0.600000024, 16, 1.5, 0.349999994
					    def c9, 3.66000009, 2.94000006, 2.66000009, 1.70000005
					    def c10, 0.222000003, 0.707000017, 0.0710000023, 6
					    def c11, 12.9898005, 78.2330017, 0, 1.95000005
					    def c12, 0.699999988, 0.400000006, 43758.5469, 2.5999999
					    def c13, 6.28318548, -3.14159274, 0.330000013, 0.300000012
					    def c14, 1.10000002, 17.5070438, 0.5, 0
					    def c15, 0.00999999978, 1, 0, 0
					    def c16, 0.0409999974, -0.0149999997, 0.0799999982, 0.0500000007
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    add r0.xy, c2.x, v0
					    mul r0.xy, r0, c2.y
					    mul r0.z, r0_abs.y, c2.z
					    mad r0.z, r0.z, r0.z, c2.w
					    mul r1.y, r0.z, r0.x
					    mul r0.x, r1_abs.y, c4.x
					    mad r0.x, r0.x, r0.x, c2.w
					    mul r1.zw, r0.x, r0.y
					    mad r0.xyz, r1.yzww, -c2.x, -c2.x
					    mul r0.w, r0.x, c4.y
					    mad r1.yzw, r0.xzxy, c4.y, c4.xwzz
					    mov r2.zw, c13
					    mad r0.x, c0.x, r2.z, r2.w
					    mad r0.x, r1.w, c6.x, r0.x
					    mad r0.x, r0.x, c3.z, c3.w
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c13.x, c13.y
					    sincos r2.y, r0.x
					    mul r0.xyz, r1.wwzw, c5.yzww
					    mov r3.xy, c3
					    mad r0.xy, c0.x, r3, r0
					    mad r0.xy, r0, c3.z, c3.w
					    frc r0.xy, r0
					    mad r0.xy, r0, c13.x, c13.y
					    sincos r3.y, r0.x
					    sincos r4.y, r0.y
					    mul r0.x, r3.y, r4.y
					    mul r0.x, r2.y, r0.x
					    mad r0.y, r0.x, c7.x, c7.y
					    mad r0.x, r0.x, c6.y, r1.z
					    add r1.x, r0.x, c6.z
					    texld r2, r1, s0
					    add r2.xyz, r2, c6.w
					    mad r1.x, r0.y, c7.z, r0.w
					    add r0.xy, r1, c16
					    texld r3, r0, s0
					    mad r0.xyw, r3.xyzz, c16.zwzz, r2.xyzz
					    mul r2.xyz, r0.xyww, r0.xyww
					    mul r2.xyz, r2, c7.w
					    mad_sat r0.xyw, r0, c8.x, r2.xyzz
					    mul r1.x, r1.z, r1.w
					    mul r1.x, r1.x, c8.y
					    add r2.xy, -r1.zwzw, c2.w
					    mul r1.x, r1.x, r2.x
					    mul r1.x, r2.y, r1.x
					    cmp r2.xy, r2, c15.z, c15.y
					    pow r2.z, r1.x, c3.x
					    mul r0.xyw, r0, r2.z
					    mul r0.xyw, r0, c9.xyzz
					    mul r1.x, r1.w, c1.y
					    mov r3.x, c0.x
					    mul r1.y, r3.x, c5.x
					    mad r1.x, r1.x, c8.z, r1.y
					    mad r1.x, r1.x, c3.z, c3.w
					    frc r1.x, r1.x
					    mad r1.x, r1.x, c13.x, c13.y
					    sincos r4.y, r1.x
					    mad r1.x, r4.y, c8.w, c8.w
					    pow r2.z, r1.x, c9.w
					    mad r1.x, r2.z, c12.x, c12.y
					    mul r0.xyw, r0, r1.x
					    dp3 r0.x, r0.xyww, c10
					    frc r0.y, r0.z
					    add r1.x, -r0.y, r0.z
					    mul r0.y, r1.w, c5.w
					    frc r0.z, r0.y
					    add r1.y, -r0.z, r0.y
					    mul r0.yz, r1.xxyw, c0.x
					    mul r0.yz, r0, c6.z
					    dp2add r0.y, r0.yzzw, c11, c11.z
					    mad r0.y, r0.y, c3.z, c3.w
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c13.x, c13.y
					    sincos r4.y, r0.y
					    mul r0.y, r4.y, c12.z
					    frc r0.y, r0.y
					    add_sat r0.y, r0.y, c4.x
					    mul r0.z, r3.x, c12.w
					    mad r0.z, r1.w, c10.w, r0.z
					    cmp r1.xy, r1.zwzw, c15.z, c15.y
					    add r1.xy, r2, r1
					    mad r0.z, r0.z, c3.z, c3.w
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c13.x, c13.y
					    sincos r2.y, r0.z
					    add r0.z, r2.y, c11.w
					    frc r0.w, r0.z
					    add r0.z, -r0.w, r0.z
					    max r1.z, r0.z, c11.z
					    min r0.z, r1.z, c14.x
					    mad r0.w, r3.x, c14.y, c14.z
					    frc r0.w, r0.w
					    mad r0.w, r0.w, c13.x, c13.y
					    sincos r2.y, r0.w
					    mad r0.w, r2.y, c15.x, c15.y
					    mad r0.y, r0.y, r0.z, r0.w
					    mul_pp r0.x, r0.y, r0.x
					    cmp_pp r0.x, -r1.x, r0.x, c11.z
					    cmp_pp oC0.xyz, -r1.y, r0.x, c11.z
					    mov_pp oC0.w, c2.w
					
					// approximately 154 instruction slots used (2 texture, 152 arithmetic)"
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
						vec4 _ScreenResolution;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bvec2 u_xlatb1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					bvec2 u_xlatb4;
					vec3 u_xlat5;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = u_xlat0.xy * vec2(2.20000005, 2.20000005);
					    u_xlat8.x = abs(u_xlat0.y) * 0.200000003;
					    u_xlat8.x = u_xlat8.x * u_xlat8.x + 1.0;
					    u_xlat5.x = u_xlat8.x * u_xlat0.x;
					    u_xlat0.x = abs(u_xlat5.x) * 0.25;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + 1.0;
					    u_xlat5.yz = u_xlat0.xx * u_xlat0.yy;
					    u_xlat0.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat12 = u_xlat0.x * 0.920000017;
					    u_xlat1.yzw = u_xlat0.zxy * vec3(0.920000017, 0.920000017, 0.920000017) + vec3(0.0409999974, 0.0399999991, 0.0399999991);
					    u_xlat0.x = _TimeX * 0.330000013 + 0.300000012;
					    u_xlat0.x = u_xlat1.w * 31.0 + u_xlat0.x;
					    u_xlat2.xyz = u_xlat1.wwz * vec3(21.0, 29.0, 250.0);
					    u_xlat0.yz = vec2(_TimeX) * vec2(0.300000012, 0.699999988) + u_xlat2.xy;
					    u_xlat2.x = floor(u_xlat2.z);
					    u_xlat0.xyz = sin(u_xlat0.xyz);
					    u_xlat4.x = u_xlat0.z * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat4.x = u_xlat0.x * 0.00170000002 + 0.0250000004;
					    u_xlat0.x = u_xlat0.x * 0.00170000002 + u_xlat1.z;
					    u_xlat1.x = u_xlat0.x + 0.00100000005;
					    u_xlat3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat3.xyz = u_xlat3.xyz + vec3(0.0500000007, 0.0500000007, 0.0500000007);
					    u_xlat1.x = u_xlat4.x * 0.75 + u_xlat12;
					    u_xlat0.xy = u_xlat1.xy + vec2(0.0409999974, -0.0149999997);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0799999982, 0.0500000007, 0.0799999982) + u_xlat3.xyz;
					    u_xlat3.xyz = u_xlat0.xyz * u_xlat0.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat3.xyz;
					    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
					    u_xlat12 = u_xlat1.z * u_xlat1.w;
					    u_xlat12 = u_xlat12 * 16.0;
					    u_xlat1.xy = (-u_xlat1.zw) + vec2(1.0, 1.0);
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat1.y * u_xlat12;
					    u_xlat12 = log2(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.300000012;
					    u_xlat12 = exp2(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = u_xlat1.w * _ScreenResolution.y;
					    u_xlat1.x = _TimeX * 3.5;
					    u_xlat12 = u_xlat12 * 1.5 + u_xlat1.x;
					    u_xlat12 = sin(u_xlat12);
					    u_xlat12 = u_xlat12 * 0.349999994 + 0.349999994;
					    u_xlat0.w = log2(u_xlat12);
					    u_xlat0 = u_xlat0 * vec4(3.66000009, 2.94000006, 2.66000009, 1.70000005);
					    u_xlat12 = exp2(u_xlat0.w);
					    u_xlat12 = u_xlat12 * 0.699999988 + 0.400000006;
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
					    u_xlat4.x = u_xlat1.w * 250.0;
					    u_xlat2.y = floor(u_xlat4.x);
					    u_xlat4.xy = u_xlat2.xy * vec2(_TimeX);
					    u_xlat4.xy = u_xlat4.xy * vec2(0.00100000005, 0.00100000005);
					    u_xlat4.x = dot(u_xlat4.xy, vec2(12.9898005, 78.2330017));
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x * 43758.5469;
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 0.25;
					    u_xlat8.xy = vec2(_TimeX) * vec2(2.5999999, 110.0);
					    u_xlat8.x = u_xlat1.w * 6.0 + u_xlat8.x;
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat12 = u_xlat8.y * 0.00999999978 + 1.0;
					    u_xlat8.x = u_xlat8.x + 1.95000005;
					    u_xlat4.y = floor(u_xlat8.x);
					    u_xlat4.xy = min(u_xlat4.xy, vec2(1.0, 1.10000002));
					    u_xlat4.x = u_xlat4.x * u_xlat4.y + u_xlat12;
					    u_xlat0.x = u_xlat4.x * u_xlat0.x;
					    u_xlatb4.xy = lessThan(u_xlat1.zwzz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
					    u_xlatb1.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.zwzz).xy;
					    {
					        bvec2 hlslcc_orTemp = u_xlatb4;
					        hlslcc_orTemp.x = u_xlatb4.x || u_xlatb1.x;
					        hlslcc_orTemp.y = u_xlatb4.y || u_xlatb1.y;
					        u_xlatb4 = hlslcc_orTemp;
					    }
					    u_xlatb4.x = u_xlatb4.y || u_xlatb4.x;
					    SV_Target0.xyz = (u_xlatb4.x) ? vec3(0.0, 0.0, 0.0) : u_xlat0.xxx;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}