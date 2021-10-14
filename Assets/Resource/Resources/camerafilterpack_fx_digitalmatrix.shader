Shader "CameraFilterPack/FX_DigitalMatrix" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 14394
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
					//   float _TimeX;
					//   float _Value;
					//   float _Value2;
					//   float _Value3;
					//   float _Value4;
					//   float _Value5;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _TimeX       c0       1
					//   _Value       c1       1
					//   _Value2      c2       1
					//   _Value3      c3       1
					//   _Value4      c4       1
					//   _Value5      c5       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c6, 24, 6, -0.5, -2
					    def c7, 0, 12, 7, 4000
					    def c8, -5, -4, -3, -2
					    def c9, 690407552, 972980224, 30, -0.98999995
					    def c10, 972881536, 0, 696556160, 704642688
					    def c11, 10, 0, 1, 1.10000002
					    def c12, 0.159154937, 0.5, 6.28318548, -3.14159274
					    def c13, 1, 0, 2, 0
					    dcl_texcoord_pp v0.xy
					    dcl_2d s0
					    mov r0.z, c6.z
					    mul r0.x, -r0.z, c1.x
					    rcp r0.x, r0.x
					    mul r0.x, r0.x, c6.x
					    mul r1.xy, r0.x, v0
					    frc r0.y, -r1.x
					    add r0.y, r0.y, r1.x
					    dp2add r0.y, r0.y, c7.yzzw, c7.x
					    mad r0.y, r0.y, c12.x, c12.y
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c12.z, c12.w
					    sincos r2.y, r0.y
					    mul r0.y, r2.y, c7.w
					    frc r0.y, r0_abs.y
					    cmp r0.y, r2.y, r0.y, -r0.y
					    mov r2.x, c7.x
					    mov r3.x, c0.x
					    dp2add r0.z, r3.x, c5.x, r2.x
					    mul r0.y, r0.z, r0.y
					    mul r0.y, r0.y, -c8.x
					    frc r0.w, -r0.y
					    add r0.y, r0.w, r0.y
					    mad r1.z, v0.y, r0.x, r0.y
					    frc r0.xy, -r1.xzzw
					    add r0.xy, r0, r1.xzzw
					    frc r1.xyz, r1.xyxw
					    mad r1.xyz, r1, c6.y, c6.zzww
					    dp2add r0.x, r0, c7.yzzw, c7.x
					    mad r0.x, r0.x, c12.x, c12.y
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c12.z, c12.w
					    sincos r2.y, r0.x
					    mul r0.x, r2.y, c7.w
					    frc r0.x, r0_abs.x
					    cmp r0.x, r2.y, r0.x, -r0.x
					    mul r0.x, r0.x, c11.x
					    frc r0.y, r0.x
					    add r0.x, -r0.y, r0.x
					    frc r0.y, -r1.x
					    add r0.y, r0.y, r1.x
					    add r0.y, -r0.y, c9.z
					    mad r0.x, r0.x, c8.z, r0.y
					    exp r0.x, r0.x
					    frc r0.y, r0.x
					    add r0.x, r0.x, -r0.y
					    rcp r0.x, r0.x
					    frc r0.y, r1.y
					    cmp r0.w, -r0.y, c11.y, c11.z
					    add r0.y, r1.y, -r0.y
					    cmp r0.w, r1.y, c7.x, r0.w
					    add r1.x, -r1_abs.z, c11.w
					    add r0.y, r0.w, r0.y
					    add r0.w, r0.y, -c11.z
					    add r2, r0.y, c8
					    cmp r0.y, -r0_abs.w, c10.x, c10.y
					    cmp r0.y, -r2_abs.w, c10.z, r0.y
					    cmp r0.y, -r2_abs.z, c10.w, r0.y
					    cmp r0.y, -r2_abs.y, c9.x, r0.y
					    cmp r0.y, r2.x, c9.y, r0.y
					    cmp r0.y, r1.x, r0.y, c7.x
					    mul r0.x, r0.x, r0.y
					    frc r0.y, r0.x
					    cmp r0.w, -r0.y, c11.y, c11.z
					    add r0.y, r0.x, -r0.y
					    cmp r0.x, r0.x, c7.x, r0.w
					    add r0.x, r0.x, r0.y
					    mul r0.y, r0.x, -c6.z
					    frc r0.w, r0.y
					    add r0.y, r0.y, -r0.w
					    cmp r0.w, -r0.w, c11.y, c11.z
					    cmp r0.w, r0.x, c7.x, r0.w
					    add r0.y, r0.w, r0.y
					    mad r0.x, r0.y, -c6.w, -r0.x
					    rcp r0.y, c1.x
					    mul r0.y, r0.y, c6.x
					    mul r1.xy, r0.y, v0
					    frc r0.w, -r1.x
					    add r0.w, r0.w, r1.x
					    dp2add r0.w, r0.w, c7.yzzw, c7.x
					    mad r0.w, r0.w, c12.x, c12.y
					    frc r0.w, r0.w
					    mad r0.w, r0.w, c12.z, c12.w
					    sincos r2.y, r0.w
					    mul r0.w, r2.y, c7.w
					    frc r0.w, r0_abs.w
					    cmp r0.w, r2.y, r0.w, -r0.w
					    mul r0.z, r0.z, r0.w
					    mul r0.z, r0.z, c11.x
					    frc r0.w, -r0.z
					    add r0.z, r0.w, r0.z
					    mad r1.z, v0.y, r0.y, r0.z
					    frc r0.yz, -r1.xxzw
					    add r0.yz, r0, r1.xxzw
					    add r1.zw, r1.xyxz, c11.z
					    frc r2.xyz, r1.xyxw
					    mad r2.xyz, r2, c6.y, c6.zzww
					    dp2add r0.y, r0.yzzw, c7.yzzw, c7.x
					    mad r0.y, r0.y, c12.x, c12.y
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c12.z, c12.w
					    sincos r3.y, r0.y
					    mul r0.y, r3.y, c7.w
					    frc r0.y, r0_abs.y
					    cmp r0.y, r3.y, r0.y, -r0.y
					    mul r0.y, r0.y, c11.x
					    frc r0.z, r0.y
					    add r0.y, -r0.z, r0.y
					    frc r0.z, -r2.x
					    add r0.z, r0.z, r2.x
					    add r0.z, -r0.z, c9.z
					    mad r0.y, r0.y, c8.z, r0.z
					    exp r0.y, r0.y
					    frc r0.z, r0.y
					    add r0.y, r0.y, -r0.z
					    rcp r0.y, r0.y
					    frc r0.z, r2.y
					    cmp r0.w, -r0.z, c11.y, c11.z
					    add r0.z, r2.y, -r0.z
					    cmp r0.w, r2.y, c7.x, r0.w
					    add r1.x, -r2_abs.z, c11.w
					    add r0.z, r0.w, r0.z
					    add r0.w, r0.z, -c11.z
					    add r2, r0.z, c8
					    cmp r0.z, -r0_abs.w, c10.x, c10.y
					    cmp r0.z, -r2_abs.w, c10.z, r0.z
					    cmp r0.z, -r2_abs.z, c10.w, r0.z
					    cmp r0.z, -r2_abs.y, c9.x, r0.z
					    cmp r0.z, r2.x, c9.y, r0.z
					    cmp r0.z, r1.x, r0.z, c7.x
					    mul r0.y, r0.y, r0.z
					    frc r0.z, r0.y
					    cmp r0.w, -r0.z, c11.y, c11.z
					    add r0.z, r0.y, -r0.z
					    cmp r0.y, r0.y, c7.x, r0.w
					    add r0.y, r0.y, r0.z
					    mul r0.z, r0.y, -c6.z
					    frc r0.w, r0.z
					    add r0.z, r0.z, -r0.w
					    cmp r0.w, -r0.w, c11.y, c11.z
					    cmp r0.w, r0.y, c7.x, r0.w
					    add r0.z, r0.w, r0.z
					    mad r0.y, r0.z, -c6.w, -r0.y
					    frc r0.zw, -r1
					    add r0.zw, r0, r1
					    dp2add r0.z, r0.zwzw, c7.yzzw, c7.x
					    mad r0.z, r0.z, c12.x, c12.y
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c12.z, c12.w
					    sincos r1.y, r0.z
					    mul r0.z, r1.y, c7.w
					    frc r0.z, r0_abs.z
					    cmp r0.z, r1.y, r0.z, -r0.z
					    add r0.z, r0.z, c9.w
					    cmp r0.zw, r0.z, c13.xyxy, c13.xyzx
					    cmp r0.yz, r0.y, c7.x, r0.xzww
					    add r1.xy, r0.yzzw, c11.zyzw
					    cmp r0.xy, r0.x, r0.yzzw, r1
					    mul r1.x, r0.x, c2.x
					    mul r1.y, r0.y, c3.x
					    mul r1.z, r0.y, c4.x
					    mov r1.w, r0.x
					    texld r0, v0, s0
					    add oC0, r1, r0
					
					// approximately 204 instruction slots used (1 texture, 203 arithmetic)"
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
						float _Value5;
						vec4 unused_0_7;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					ivec2 u_xlati0;
					uint u_xlatu0;
					bool u_xlatb0;
					vec4 u_xlat1;
					int u_xlati1;
					uint u_xlatu1;
					bool u_xlatb1;
					vec3 u_xlat2;
					bvec4 u_xlatb2;
					vec3 u_xlat3;
					ivec3 u_xlati3;
					uint u_xlatu3;
					bool u_xlatb3;
					uint u_xlatu4;
					bool u_xlatb4;
					float u_xlat6;
					int u_xlati6;
					uint u_xlatu6;
					bool u_xlatb6;
					float u_xlat9;
					int u_xlati9;
					uint u_xlatu9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0.x = _Value * 0.5;
					    u_xlat0.x = 24.0 / u_xlat0.x;
					    u_xlat3.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyx;
					    u_xlat1.xy = ceil(u_xlat3.zz);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat0.yzw = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-0.5, -0.5, -2.0);
					    u_xlat1.x = dot(u_xlat1.xx, vec2(12.0, 7.0));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 4000.0;
					    u_xlatb10 = u_xlat1.x>=(-u_xlat1.x);
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb10) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlat10 = dot(vec2(_TimeX), vec2(vec2(_Value5, _Value5)));
					    u_xlat1.x = u_xlat10 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 5.0;
					    u_xlat1.x = ceil(u_xlat1.x);
					    u_xlat0.x = vs_TEXCOORD0.y * u_xlat0.x + u_xlat1.x;
					    u_xlat1.z = ceil(u_xlat0.x);
					    u_xlat0.x = dot(u_xlat1.yz, vec2(12.0, 7.0));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 4000.0;
					    u_xlatb1 = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb1) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 10.0;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat3.x = ceil(u_xlat0.y);
					    u_xlat3.x = (-u_xlat3.x) + 30.0;
					    u_xlat0.x = (-u_xlat0.x) * 3.0 + u_xlat3.x;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlati0.xy = ivec2(u_xlat0.xz);
					    u_xlatb6 = 1.10000002<abs(u_xlat0.w);
					    u_xlatb9 = u_xlati0.y==1;
					    u_xlatb2 = equal(u_xlati0.yyyy, ivec4(5, 4, 3, 2));
					    u_xlatu3 = u_xlatb9 ? 972881535u : uint(0);
					    u_xlatu3 = (u_xlatb2.w) ? 696556137u : u_xlatu3;
					    u_xlatu3 = (u_xlatb2.z) ? 704642687u : u_xlatu3;
					    u_xlatu3 = (u_xlatb2.y) ? 690407533u : u_xlatu3;
					    u_xlatu3 = (u_xlatb2.x) ? 972980223u : u_xlatu3;
					    u_xlatu3 = (u_xlatb6) ? 0u : u_xlatu3;
					    u_xlati6 = int(uint(u_xlati0.x) ^ u_xlatu3);
					    u_xlatu0 =  uint(max(u_xlati0.x, (-u_xlati0.x)));
					    //null = uintBitsToFloat(u_xlatu3 % u_xlatu0);
					    u_xlatu0 = u_xlatu3 / u_xlatu0;
					    u_xlati3.x = int(uint(u_xlati6) & 2147483648u);
					    u_xlatu6 =  uint(0 - int(u_xlatu0));
					    u_xlatu0 = (u_xlati3.x != 0) ? u_xlatu6 : u_xlatu0;
					    u_xlati3.x = int(u_xlatu0 ^ 2u);
					    u_xlati3.x = int(uint(u_xlati3.x) & 2147483648u);
					    u_xlatu6 =  uint(max(int(u_xlatu0), (-int(u_xlatu0))));
					    u_xlatu6 = u_xlatu6 >> 1u;
					    u_xlatu9 =  uint(0 - int(u_xlatu6));
					    u_xlatu3 = (u_xlati3.x != 0) ? u_xlatu9 : u_xlatu6;
					    u_xlati3.x = int(u_xlatu3) << 1;
					    u_xlatb0 = u_xlati3.x<int(u_xlatu0);
					    u_xlat3.x = 24.0 / _Value;
					    u_xlat1.xy = u_xlat3.xx * vs_TEXCOORD0.xy;
					    u_xlat2.xy = ceil(u_xlat1.xx);
					    u_xlat6 = dot(u_xlat2.xx, vec2(12.0, 7.0));
					    u_xlat6 = sin(u_xlat6);
					    u_xlat6 = u_xlat6 * 4000.0;
					    u_xlatb9 = u_xlat6>=(-u_xlat6);
					    u_xlat6 = fract(abs(u_xlat6));
					    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
					    u_xlat6 = u_xlat10 * u_xlat6;
					    u_xlat6 = u_xlat6 * 10.0;
					    u_xlat6 = ceil(u_xlat6);
					    u_xlat1.z = vs_TEXCOORD0.y * u_xlat3.x + u_xlat6;
					    u_xlat2.z = ceil(u_xlat1.z);
					    u_xlat3.xy = u_xlat1.xz + vec2(1.0, 1.0);
					    u_xlat1.xyz = fract(u_xlat1.xyx);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-0.5, -0.5, -2.0);
					    u_xlat3.xy = ceil(u_xlat3.xy);
					    u_xlat3.x = dot(u_xlat3.xy, vec2(12.0, 7.0));
					    u_xlat3.x = sin(u_xlat3.x);
					    u_xlat6 = dot(u_xlat2.yz, vec2(12.0, 7.0));
					    u_xlat3.y = sin(u_xlat6);
					    u_xlat3.xy = u_xlat3.xy * vec2(4000.0, 4000.0);
					    u_xlatb9 = u_xlat3.y>=(-u_xlat3.y);
					    u_xlat6 = fract(abs(u_xlat3.y));
					    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
					    u_xlat6 = u_xlat6 * 10.0;
					    u_xlat6 = floor(u_xlat6);
					    u_xlat9 = ceil(u_xlat1.x);
					    u_xlat9 = (-u_xlat9) + 30.0;
					    u_xlat6 = (-u_xlat6) * 3.0 + u_xlat9;
					    u_xlat6 = exp2(u_xlat6);
					    u_xlati6 = int(u_xlat6);
					    u_xlati9 = int(u_xlat1.y);
					    u_xlatb1 = 1.10000002<abs(u_xlat1.z);
					    u_xlatb4 = u_xlati9==1;
					    u_xlatb2 = equal(ivec4(u_xlati9), ivec4(5, 4, 3, 2));
					    u_xlatu9 = u_xlatb4 ? 972881535u : uint(0);
					    u_xlatu9 = (u_xlatb2.w) ? 696556137u : u_xlatu9;
					    u_xlatu9 = (u_xlatb2.z) ? 704642687u : u_xlatu9;
					    u_xlatu9 = (u_xlatb2.y) ? 690407533u : u_xlatu9;
					    u_xlatu9 = (u_xlatb2.x) ? 972980223u : u_xlatu9;
					    u_xlatu9 = (u_xlatb1) ? 0u : u_xlatu9;
					    u_xlati1 = int(uint(u_xlati6) ^ u_xlatu9);
					    u_xlatu6 =  uint(max(u_xlati6, (-u_xlati6)));
					    //null = uintBitsToFloat(u_xlatu9 % u_xlatu6);
					    u_xlatu6 = u_xlatu9 / u_xlatu6;
					    u_xlati9 = int(uint(u_xlati1) & 2147483648u);
					    u_xlatu1 =  uint(0 - int(u_xlatu6));
					    u_xlatu6 = (u_xlati9 != 0) ? u_xlatu1 : u_xlatu6;
					    u_xlati9 = int(u_xlatu6 ^ 2u);
					    u_xlati9 = int(uint(u_xlati9) & 2147483648u);
					    u_xlatu1 =  uint(max(int(u_xlatu6), (-int(u_xlatu6))));
					    u_xlatu1 = u_xlatu1 >> 1u;
					    u_xlatu4 =  uint(0 - int(u_xlatu1));
					    u_xlatu9 = (u_xlati9 != 0) ? u_xlatu4 : u_xlatu1;
					    u_xlati9 = int(u_xlatu9) << 1;
					    u_xlatb6 = u_xlati9<int(u_xlatu6);
					    u_xlatb9 = u_xlat3.x>=(-u_xlat3.x);
					    u_xlat3.x = fract(abs(u_xlat3.x));
					    u_xlat3.x = (u_xlatb9) ? u_xlat3.x : (-u_xlat3.x);
					    u_xlatb3 = u_xlat3.x<0.98999995;
					    u_xlati3.xz = (bool(u_xlatb3)) ? ivec2(int(0x40000000u), 1065353216) : ivec2(1065353216, 0);
					    u_xlat3.xy = bool(u_xlatb6) ? intBitsToFloat(u_xlati3.xz) : vec2(0.0, 0.0);
					    u_xlat1.xy = u_xlat3.xy + vec2(1.0, 0.0);
					    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat3.xy;
					    u_xlat1.xy = u_xlat0.xy * vec2(_Value2, _Value3);
					    u_xlat1.z = u_xlat0.y * _Value4;
					    u_xlat1.w = u_xlat0.x;
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0 = u_xlat1 + u_xlat0;
					    return;
					}"
				}
			}
		}
	}
}