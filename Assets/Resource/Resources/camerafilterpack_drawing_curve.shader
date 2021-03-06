Shader "CameraFilterPack/Drawing_Curve" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 47432
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
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _Value       c0       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c1, 0.001953125, 0.000390625006, 0.300000012, 0.400000006
					    def c2, -4, -5, 1, 0.5
					    def c3, 0, 1, 0.5, 0.400000006
					    def c4, 1.5915494, 0.5, 6.28318548, -3.14159274
					    def c5, 0.0299999993, 0.119999997, 0.75, 0
					    def c6, -0, -1, -2, -3
					    def c7, -0.707099974, 0.707099974, 3, 0
					    def c8, 0, 1, 0, 0.600000024
					    def c9, 1, 0, 0.300000012, 0.200000003
					    defi i0, 6, 0, 0, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mov r0.xy, c1
					    mul r0.xy, r0, c0.x
					    texld r1, v0, s0
					    rcp r0.z, r0.x
					    dp3 r0.w, r1.xzyw, c1.zzww
					    mov r1.xy, c8.yzzw
					    rep i0
					      add r2, r1.y, c6
					      add r3.xyz, r1.y, c2
					      cmp r4.xyz, -r2_abs.x, c7, c7.w
					      cmp r4.xyz, -r2_abs.y, c8.zyww, r4
					      cmp r2.xyz, -r2_abs.z, c3, r4
					      cmp r2.xyz, -r2_abs.w, c3.yxww, r2
					      cmp r2.xyz, -r3_abs.x, c9, r2
					      cmp r2.xyz, -r3_abs.y, c9.yxww, r2
					      mul r3.xyw, r2.yyzx, v0.yxzy
					      mad r1.z, v0.x, r2.x, -r3.x
					      add r1.w, r3.w, r3.y
					      mul r2.x, r0.y, r3.z
					      mad r1.w, r2.x, c2.w, r1.w
					      mad r1.z, r1.z, c4.x, c4.y
					      frc r1.z, r1.z
					      mad r1.z, r1.z, c4.z, c4.w
					      sincos r4.y, r1.z
					      mad r1.z, r4.y, -c5.x, r1.w
					      mul r1.z, r0.z, r1.z
					      frc r1.w, r1_abs.z
					      cmp r1.z, r1.z, r1.w, -r1.w
					      mul r1.w, r0.x, r1.z
					      mad r1.z, r1.z, r0.x, -r2.x
					      mad r2.y, r1.y, -c5.y, c5.z
					      add r2.y, r0.w, -r2.y
					      mad r1.w, r0.y, r3.z, -r1.w
					      rcp r2.x, r2.x
					      mad r1.w, r1.w, r2.x, -c2.w
					      rcp r2.x, r2.z
					      mul r1.w, r1.w, r2.x
					      add r2.z, -r2.z, c2.w
					      mad r1.w, r2.z, -r2.x, r1_abs.w
					      min r2.x, r1.x, r1.w
					      cmp r1.w, r2.y, -c8.z, -c8.y
					      cmp r1.z, r1.z, c8.z, r1.w
					      cmp r1.x, r1.z, r1.x, r2.x
					      mov r1.y, r3.z
					    endrep
					    mov oC0.xyz, r1.x
					    mov oC0.w, c8.z
					
					// approximately 57 instruction slots used (1 texture, 56 arithmetic)"
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
						vec4 unused_0_2;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					bvec4 u_xlatb2;
					bvec2 u_xlatb3;
					vec3 u_xlat4;
					bvec3 u_xlatb4;
					vec3 u_xlat5;
					bool u_xlatb5;
					float u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat13;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD0.xy, vec2(0.707099974, -0.707099974));
					    u_xlat0 = _Value * 0.000195312503 + u_xlat0;
					    u_xlat5.xyz = vs_TEXCOORD0.yyx * vec3(0.707099974, -10.0, 10.0);
					    u_xlat5.x = vs_TEXCOORD0.x * -0.707099974 + (-u_xlat5.x);
					    u_xlat1.xyz = sin(u_xlat5.yzy);
					    u_xlat5.x = u_xlat5.x * 10.0;
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat0 = (-u_xlat5.x) * 0.0299999993 + u_xlat0;
					    u_xlat5.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.001953125, 0.000390625006, 0.000781250012);
					    u_xlat0 = u_xlat0 / u_xlat5.x;
					    u_xlatb16 = u_xlat0>=(-u_xlat0);
					    u_xlat0 = fract(abs(u_xlat0));
					    u_xlat0 = (u_xlatb16) ? u_xlat0 : (-u_xlat0);
					    u_xlat0 = u_xlat5.x * u_xlat0;
					    u_xlat16 = _Value * 0.000390625006 + (-u_xlat0);
					    u_xlatb0 = u_xlat0<u_xlat5.y;
					    u_xlat10 = u_xlat16 / u_xlat5.y;
					    u_xlat10 = u_xlat10 + -0.5;
					    u_xlat10 = u_xlat10 * 0.333333343;
					    u_xlat10 = abs(u_xlat10) + 0.833333313;
					    u_xlat10 = min(u_xlat10, 1.0);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat16 = dot(u_xlat2.xzy, vec3(0.300000012, 0.300000012, 0.400000006));
					    u_xlatb2 = lessThan(vec4(u_xlat16), vec4(0.75, 0.629999995, 0.50999999, 0.390000015));
					    u_xlatb3.xy = lessThan(vec4(u_xlat16), vec4(0.270000011, 0.150000036, 0.0, 0.0)).xy;
					    u_xlatb0 = u_xlatb0 && u_xlatb2.x;
					    u_xlat0 = (u_xlatb0) ? u_xlat10 : 1.0;
					    u_xlat13.xy = vec2(vec2(_Value, _Value)) * vec2(0.000390625006, 0.000781250012) + vs_TEXCOORD0.xy;
					    u_xlat13.xy = (-u_xlat1.xy) * vec2(0.0299999993, 0.0299999993) + u_xlat13.xy;
					    u_xlat13.xy = u_xlat13.xy / u_xlat5.xx;
					    u_xlatb4.xy = greaterThanEqual(u_xlat13.xyxx, (-u_xlat13.xyxx)).xy;
					    u_xlat13.xy = fract(abs(u_xlat13.xy));
					    {
					        vec2 hlslcc_movcTemp = u_xlat13;
					        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat13.x : (-u_xlat13.x);
					        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat13.y : (-u_xlat13.y);
					        u_xlat13 = hlslcc_movcTemp;
					    }
					    u_xlat13.xy = u_xlat5.xx * u_xlat13.xy;
					    u_xlat10 = _Value * 0.000781250012 + (-u_xlat13.x);
					    u_xlat10 = u_xlat10 / u_xlat5.z;
					    u_xlat10 = u_xlat10 + -0.5;
					    u_xlat10 = u_xlat10 * 1.66666663;
					    u_xlat10 = abs(u_xlat10) + 0.166666701;
					    u_xlat10 = min(u_xlat0, u_xlat10);
					    u_xlatb15 = u_xlat13.x<u_xlat5.z;
					    u_xlatb15 = u_xlatb2.y && u_xlatb15;
					    u_xlat0 = (u_xlatb15) ? u_xlat10 : u_xlat0;
					    u_xlat4.xyz = vec3(vec3(_Value, _Value, _Value)) * vec3(0.000585937523, 0.0009765625, 0.00117187505) + vs_TEXCOORD0.xyx;
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(0.0299999993, 0.0299999993, 0.0299999993) + u_xlat4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz / u_xlat5.xxx;
					    u_xlatb4.xyz = greaterThanEqual(u_xlat1.xyzx, (-u_xlat1.xyzx)).xyz;
					    u_xlat1.xyz = fract(abs(u_xlat1.xyz));
					    {
					        vec3 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat1.x : (-u_xlat1.x);
					        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat1.y : (-u_xlat1.y);
					        hlslcc_movcTemp.z = (u_xlatb4.z) ? u_xlat1.z : (-u_xlat1.z);
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = u_xlat5.xxx * u_xlat1.xyz;
					    u_xlat10 = _Value * 0.00117187505 + (-u_xlat1.x);
					    u_xlat2.xy = vec2(vec2(_Value, _Value)) * vec2(0.00117187505, 0.00156250002);
					    u_xlat10 = u_xlat10 / u_xlat2.x;
					    u_xlat10 = u_xlat10 + -0.5;
					    u_xlat10 = u_xlat10 + u_xlat10;
					    u_xlat10 = min(u_xlat0, abs(u_xlat10));
					    u_xlatb15 = u_xlat1.x<u_xlat2.x;
					    u_xlatb15 = u_xlatb2.z && u_xlatb15;
					    u_xlat0 = (u_xlatb15) ? u_xlat10 : u_xlat0;
					    u_xlat10 = _Value * 0.00156250002 + (-u_xlat13.y);
					    u_xlatb15 = u_xlat13.y<u_xlat2.y;
					    u_xlat10 = u_xlat10 / u_xlat2.y;
					    u_xlat10 = u_xlat10 + -0.5;
					    u_xlat10 = u_xlat10 * 2.5;
					    u_xlat10 = abs(u_xlat10) + -0.249999985;
					    u_xlat10 = min(u_xlat0, u_xlat10);
					    u_xlatb15 = u_xlatb2.w && u_xlatb15;
					    u_xlat0 = (u_xlatb15) ? u_xlat10 : u_xlat0;
					    u_xlat10 = _Value * 0.001953125 + (-u_xlat1.y);
					    u_xlat10 = u_xlat10 / u_xlat5.x;
					    u_xlatb5 = u_xlat1.y<u_xlat5.x;
					    u_xlatb5 = u_xlatb3.x && u_xlatb5;
					    u_xlat10 = u_xlat10 + -0.5;
					    u_xlat10 = u_xlat10 * 3.33333325;
					    u_xlat10 = abs(u_xlat10) + -0.666666627;
					    u_xlat10 = min(u_xlat0, u_xlat10);
					    u_xlat0 = (u_xlatb5) ? u_xlat10 : u_xlat0;
					    u_xlat5.x = _Value * 0.00234375009 + (-u_xlat1.z);
					    u_xlat10 = _Value * 0.00234375009;
					    u_xlat5.x = u_xlat5.x / u_xlat10;
					    u_xlatb10 = u_xlat1.z<u_xlat10;
					    u_xlatb10 = u_xlatb3.y && u_xlatb10;
					    u_xlat5.x = u_xlat5.x + -0.5;
					    u_xlat5.x = u_xlat5.x * 5.0;
					    u_xlat5.x = abs(u_xlat5.x) + -1.5;
					    u_xlat5.x = min(u_xlat0, u_xlat5.x);
					    SV_Target0.xyz = (bool(u_xlatb10)) ? u_xlat5.xxx : vec3(u_xlat0);
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
	}
}