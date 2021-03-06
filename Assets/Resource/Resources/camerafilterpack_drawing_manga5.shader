Shader "CameraFilterPack/Drawing_Manga5" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_DotSize ("_DotSize", Range(0, 1)) = 0
		_ColorLevel ("_ColorLevel", Range(0, 10)) = 7
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 64188
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
					//   float _DotSize;
					//   sampler2D _MainTex;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _DotSize     c0       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c1, 0.349999994, 0.5, 0.25, 0.400000006
					    def c2, 0.0625, 0.125, -0.200000018, 0.0999999642
					    def c3, -2, 3, 3560.46875, 0.707106411
					    def c4, 0.159154937, 0.5, 6.28318548, -3.14159274
					    def c5, -0.00390625, 0.00390625, 0, 0.0399999991
					    def c6, 0.300000012, 0.589999974, 0.109999999, 0.25
					    def c7, 0, -1, 1, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    add r0, c5.zyyy, v0.xyxy
					    texld r1, r0, s0
					    texld r0, r0.zwzw, s0
					    dp4 r0.x, r0, c6
					    dp4 r0.y, r1, c6
					    add r1, c5.xzxy, v0.xyxy
					    texld r2, r1.zwzw, s0
					    texld r1, r1, s0
					    dp4 r0.z, r1, c6
					    dp4 r0.w, r2, c6
					    mad r0.y, r0.y, -c3.x, r0.w
					    add r0.y, r0.x, r0.y
					    add r1, c5.xxyx, v0.xyxy
					    texld r2, r1, s0
					    texld r1, r1.zwzw, s0
					    dp4 r1.x, r1, c6
					    dp4 r1.y, r2, c6
					    add r0.y, r0.y, -r1.y
					    mad r0.y, r1.y, c3.x, r0.y
					    add r0.x, r0.x, r1.x
					    mad r0.x, r0.z, -c3.x, r0.x
					    add r0.xy, -r1.yxzw, r0
					    mad r0.x, r0.z, c3.x, r0.x
					    add r0.x, -r0.w, r0.x
					    mul r0.y, r0.y, r0.y
					    mad r0.x, r0.x, r0.x, r0.y
					    add r0.x, -r0.x, c5.w
					    cmp r0.x, r0.x, c7.x, c7.y
					    rcp r0.y, c0.x
					    mul r0.y, r0.y, c3.z
					    mul r0.zw, c3.w, v0.xyxy
					    add r0.z, r0.w, r0.z
					    mad r0.w, v0.x, c3.w, -r0.w
					    mul r0.w, r0.y, r0.w
					    mul r0.y, r0.y, r0.z
					    mad r0.y, r0.y, c4.x, c4.y
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c4.z, c4.w
					    sincos r1.x, r0.y
					    mad r0.y, r1.x, c1.x, c1.y
					    mad r0.z, r0.w, c4.x, c4.y
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c4.z, c4.w
					    sincos r1.x, r0.z
					    mad_pp r0.y, r1.x, c1.z, r0.y
					    dp2add r0.x, r0.x, r0.y, c5.z
					    texld r1, v0, s0
					    mad r0.yzw, r1.xxyz, -c3.x, -r0.y
					    mov r2, c2
					    mad r2.xy, c0.x, r2, r2.zwzw
					    add r1.w, -r2.x, r2.y
					    rcp r1.w, r1.w
					    mul_sat r1.w, r1.w, -r2.x
					    mad r2.x, r1.w, c3.x, c3.y
					    mul r1.w, r1.w, r1.w
					    mad r1.xyz, r2.x, r1.w, r1
					    add r0.yzw, r0, r1.xxyz
					    add r1.w, -r1.x, c1.w
					    cmp r0.yzw, r1.w, r1.xxyz, r0
					    add oC0.xyz, r0.x, r0.yzww
					    mov oC0.w, c7.z
					
					// approximately 76 instruction slots used (7 texture, 69 arithmetic)"
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
						float _DotSize;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.xyxy + vec4(0.0, 0.00390625, 0.00390625, 0.00390625);
					    u_xlat1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0.x = dot(u_xlat0, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat3.x = dot(u_xlat1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, 0.0, -0.00390625, 0.00390625);
					    u_xlat2 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat6.x = dot(u_xlat1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat9 = dot(u_xlat2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat3.x = u_xlat3.x * 2.0 + u_xlat9;
					    u_xlat3.x = u_xlat0.x + u_xlat3.x;
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(-0.00390625, -0.00390625, 0.00390625, -0.00390625);
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat1.x = dot(u_xlat1, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat1.y = dot(u_xlat2, vec4(0.300000012, 0.589999974, 0.109999999, 0.25));
					    u_xlat3.x = u_xlat3.x + (-u_xlat1.y);
					    u_xlat0.y = (-u_xlat1.y) * 2.0 + u_xlat3.x;
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat0.x = u_xlat6.x * 2.0 + u_xlat0.x;
					    u_xlat0.xy = (-u_xlat1.yx) + u_xlat0.xy;
					    u_xlat0.x = (-u_xlat6.x) * 2.0 + u_xlat0.x;
					    u_xlat0.x = (-u_xlat9) + u_xlat0.x;
					    u_xlat3.x = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat3.x;
					    u_xlatb0 = 0.0399999991<u_xlat0.x;
					    u_xlat0.x = u_xlatb0 ? -1.0 : float(0.0);
					    u_xlat3.x = 2136.28125 / _DotSize;
					    u_xlat3.x = u_xlat3.x * 1.66666663;
					    u_xlat6.xy = vs_TEXCOORD0.xy * vec2(0.707106411, 0.707106411);
					    u_xlat6.x = u_xlat6.y + u_xlat6.x;
					    u_xlat9 = vs_TEXCOORD0.x * 0.707106411 + (-u_xlat6.y);
					    u_xlat3.z = u_xlat3.x * u_xlat9;
					    u_xlat3.x = u_xlat3.x * u_xlat6.x;
					    u_xlat3.xy = cos(u_xlat3.xz);
					    u_xlat3.x = u_xlat3.x * 0.349999994 + 0.5;
					    u_xlat3.x = u_xlat3.y * 0.25 + u_xlat3.x;
					    u_xlat0.x = dot(u_xlat0.xx, u_xlat3.xx);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + (-u_xlat3.xxx);
					    u_xlat2.xy = vec2(_DotSize) * vec2(0.0625, 0.125) + vec2(-0.200000018, 0.0999999642);
					    u_xlat10 = (-u_xlat2.x) + u_xlat2.y;
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat10 = u_xlat10 * (-u_xlat2.x);
					    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
					    u_xlat2.x = u_xlat10 * -2.0 + 3.0;
					    u_xlat10 = u_xlat10 * u_xlat10;
					    u_xlat1.xyz = u_xlat2.xxx * vec3(u_xlat10) + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat1.xyz;
					    u_xlatb10 = 0.400000006<u_xlat1.x;
					    u_xlat3.xyz = (bool(u_xlatb10)) ? u_xlat3.xyz : u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat3.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}