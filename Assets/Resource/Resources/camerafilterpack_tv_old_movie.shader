Shader "CameraFilterPack/TV_Old_Movie" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 10207
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
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _TimeX       c0       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c1, 15, 0, 1, 43758.5469
					    def c2, 12.9898005, 78.2330017, 0, 0.00200000009
					    def c3, 23, 8, 0.699999988, 16
					    def c4, 0.212599993, 0.715200007, 0.0722000003, 0.400000006
					    def c5, 0.159154937, 0.5, 6.28318548, -3.14159274
					    def c6, 0.300000012, 0.699999988, 0.400000006, 8
					    def c7, 0.00999999978, 0.125, 2, -8
					    def c8, 18, 0, 6, 0.180141002
					    def c9, 0.0208350997, -0.0851330012, -0.330299497, 0.999866009
					    def c10, -2, 1.57079637, 0.99998647, 0.5
					    def c11, 0.100000001, 1, 0.0625, 0.5
					    def c12, 7, 0, 24, 0.200000003
					    def c13, 25, 0, 26, 0
					    def c14, 0.200000003, 0.300000012, 27, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mov r0.xy, c1
					    mul r0.x, r0.x, c0.x
					    frc r0.z, r0.x
					    add r0.x, r0.x, -r0.z
					    cmp r0.z, -r0.z, c1.y, c1.z
					    cmp r0.y, c0.x, r0.y, r0.z
					    add r0.x, r0.y, r0.x
					    mov r0.y, c1.z
					    dp2add r1.x, r0, c2, c2.z
					    mad r1.x, r1.x, c5.x, c5.y
					    frc r1.x, r1.x
					    mad r1.x, r1.x, c5.z, c5.w
					    sincos r2.y, r1.x
					    mul r1.x, r2.y, c1.w
					    frc r1.x, r1.x
					    add r0.zw, r0.x, c3.xyxy
					    dp2add r0.z, r0.zyzw, c2, c2.z
					    mad r0.z, r0.z, c5.x, c5.y
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c5.z, c5.w
					    sincos r2.y, r0.z
					    mul r0.z, r2.y, c1.w
					    frc r1.y, r0.z
					    mad r1.xy, r1, c2.w, v0
					    texld r1, r1, s0
					    dp3 r0.z, c4, r1
					    mul r0.z, r0.z, c3.z
					    dp2add r0.w, r0.wyzw, c2, c2.z
					    mad r0.w, r0.w, c5.x, c5.y
					    frc r0.w, r0.w
					    mad r0.w, r0.w, c5.z, c5.w
					    sincos r1.y, r0.w
					    mul r0.w, r1.y, c1.w
					    frc r0.w, r0.w
					    add r1.xy, c1.z, -v0
					    mul r1.x, r1.x, v0.x
					    mul r1.x, r1.x, v0.y
					    mul r1.x, r1.y, r1.x
					    mul r1.x, r1.x, c3.w
					    add r1.y, r0.w, c5.y
					    mad r1.y, r1.y, c6.x, c6.y
					    mul r1.zw, r0.w, c6
					    mad r1.y, r1.x, r1.y, r1.z
					    add r1.y, r1.y, c1.z
					    pow r2.x, r1.x, c4.w
					    mul r1.x, r1.y, r2.x
					    frc r1.y, r1.w
					    add r1.y, r1.w, -r1.y
					    add r2, r0.xyxy, c12.xyzy
					    dp2add r1.z, r2, c2, c2.z
					    mad r1.z, r1.z, c5.x, c5.y
					    frc r1.z, r1.z
					    mad r1.z, r1.z, c5.z, c5.w
					    sincos r3.y, r1.z
					    mul r1.z, r3.y, c1.w
					    frc r2.y, r1.z
					    add r1.z, r2.y, -c5.y
					    add r1.w, -r2.y, c12.w
					    mul r3.xy, r2.y, v0.yxzw
					    mad r3.x, r3.x, c7.x, r3.y
					    add r1.z, r1.z, r3.x
					    pow r3.x, r1_abs.z, c7.y
					    add r1.z, -r3.x, c7.z
					    cmp r1.z, r1.w, r1.z, r3.x
					    mad r1.z, r1.z, c5.y, c5.y
					    mul r1.z, r1.z, r1.x
					    cmp r1.x, -r1.y, r1.x, r1.z
					    add r1.y, -r1.y, c1.z
					    dp2add r1.z, r2.zwzw, c2, c2.z
					    mad r1.z, r1.z, c5.x, c5.y
					    frc r1.z, r1.z
					    mad r1.z, r1.z, c5.z, c5.w
					    sincos r3.y, r1.z
					    mul r1.z, r3.y, c1.w
					    frc r1.z, r1.z
					    add r1.w, r1.z, -c5.y
					    add r2.z, -r1.z, c12.w
					    mul r3.xy, r1.z, v0.yxzw
					    mad r1.z, r3.x, c7.x, r3.y
					    add r1.z, r1.w, r1.z
					    pow r2.w, r1_abs.z, c7.y
					    add r1.z, -r2.w, c7.z
					    cmp r1.z, r2.z, r1.z, r2.w
					    mad r1.z, r1.z, c5.y, c5.y
					    mul r1.z, r1.z, r1.x
					    cmp r1.x, r1.y, r1.x, r1.z
					    add r1.yz, r0.xxyw, c8.xxyw
					    dp2add r1.y, r1.yzzw, c2, c2.z
					    mad r1.y, r1.y, c5.x, c5.y
					    frc r1.y, r1.y
					    mad r1.y, r1.y, c5.z, c5.w
					    sincos r3.y, r1.y
					    mul r1.y, r3.y, c1.w
					    frc r1.y, r1.y
					    mad r1.y, r1.y, -c7.w, -c7.z
					    max r2.z, r1.y, c1.y
					    frc r1.y, r2.z
					    add r1.y, r2.z, -r1.y
					    if_lt -r1.y, c1.y
					      add r1.zw, r0.xyxy, c8.xyzy
					      dp2add r1.z, r1.zwzw, c2, c2.z
					      mad r1.z, r1.z, c5.x, c5.y
					      frc r1.z, r1.z
					      mad r1.z, r1.z, c5.z, c5.w
					      sincos r3.y, r1.z
					      mul r1.z, r3.y, c1.w
					      frc r2.x, r1.z
					      mul r1.z, r0.w, c7.x
					      add r2.yz, r2.xxyw, -v0.xxyw
					      rcp r1.w, r2.y
					      mul r1.w, r1.w, r2.z
					      mov_sat r2.w, r1_abs.w
					      add r3.x, r1_abs.w, -c1.z
					      rcp r3.y, r1_abs.w
					      cmp r3.x, r3.x, r3.y, c1.z
					      mul r2.w, r2.w, r3.x
					      mul r3.x, r2.w, r2.w
					      mad r3.y, r3.x, c9.x, c9.y
					      mad r3.y, r3.x, r3.y, c8.w
					      mad r3.y, r3.x, r3.y, c9.z
					      mad r3.x, r3.x, r3.y, c9.w
					      mul r2.w, r2.w, r3.x
					      add r3.x, -r1_abs.w, c1.z
					      cmp r3.x, r3.x, c1.y, c1.z
					      mad r3.y, r2.w, c10.x, c10.y
					      mad r2.w, r3.y, r3.x, r2.w
					      min r3.x, r1.w, c1.z
					      cmp r1.w, r3.x, c1.y, c1.z
					      add r3.x, r2.w, r2.w
					      mad r1.w, r1.w, -r3.x, r2.w
					      mul r1.z, r1.z, r1.z
					      mul r1.w, r1.w, r2.x
					      mad r1.w, r1.w, c10.z, c10.w
					      frc r1.w, r1.w
					      mad r1.w, r1.w, c5.z, c5.w
					      sincos r3.y, r1.w
					      mad r1.w, r3.y, c11.x, c11.y
					      mul r1.z, r1.w, r1.z
					      dp2add r1.z, r2.yzzw, r2.yzzw, -r1.z
					      pow r2.x, r1.z, c11.z
					      cmp r1.z, r1.z, r2.x, c12.w
					      mad r0.w, r0.w, -c11.w, c11.y
					      mad r0.w, r0.w, c14.x, c14.y
					      lrp r2.x, r1.z, c1.z, r0.w
					      mul r1.x, r1.x, r2.x
					    endif
					    if_lt c1.z, r1.y
					      add r2, r0.xyxy, c13.xyzy
					      dp2add r0.w, r2, c2, c2.z
					      mad r0.w, r0.w, c5.x, c5.y
					      frc r0.w, r0.w
					      mad r0.w, r0.w, c5.z, c5.w
					      sincos r3.y, r0.w
					      mul r0.w, r3.y, c1.w
					      frc r2.x, r0.w
					      dp2add r0.w, r2.zwzw, c2, c2.z
					      mad r0.w, r0.w, c5.x, c5.y
					      frc r0.w, r0.w
					      mad r0.w, r0.w, c5.z, c5.w
					      sincos r3.y, r0.w
					      mul r0.w, r3.y, c1.w
					      frc r2.y, r0.w
					      add r0.xy, r0, c14.zwzw
					      dp2add r0.x, r0, c2, c2.z
					      mad r0.x, r0.x, c5.x, c5.y
					      frc r0.x, r0.x
					      mad r0.x, r0.x, c5.z, c5.w
					      sincos r3.y, r0.x
					      mul r0.x, r3.y, c1.w
					      frc r0.x, r0.x
					      mul r0.y, r0.x, c7.x
					      add r1.yz, r2.xxyw, -v0.xxyw
					      rcp r0.w, r1.y
					      mul r0.w, r0.w, r1.z
					      mov_sat r1.w, r0_abs.w
					      add r2.y, r0_abs.w, -c1.z
					      rcp r2.z, r0_abs.w
					      cmp r2.y, r2.y, r2.z, c1.z
					      mul r1.w, r1.w, r2.y
					      mul r2.y, r1.w, r1.w
					      mad r2.z, r2.y, c9.x, c9.y
					      mad r2.z, r2.y, r2.z, c8.w
					      mad r2.z, r2.y, r2.z, c9.z
					      mad r2.y, r2.y, r2.z, c9.w
					      mul r1.w, r1.w, r2.y
					      add r2.y, -r0_abs.w, c1.z
					      cmp r2.y, r2.y, c1.y, c1.z
					      mad r2.z, r1.w, c10.x, c10.y
					      mad r1.w, r2.z, r2.y, r1.w
					      min r2.y, r0.w, c1.z
					      cmp r0.w, r2.y, c1.y, c1.z
					      add r2.y, r1.w, r1.w
					      mad r0.w, r0.w, -r2.y, r1.w
					      mul r0.y, r0.y, r0.y
					      mul r0.w, r0.w, r2.x
					      mad r0.w, r0.w, c10.z, c10.w
					      frc r0.w, r0.w
					      mad r0.w, r0.w, c5.z, c5.w
					      sincos r2.y, r0.w
					      mad r0.w, r2.y, c11.x, c11.y
					      mul r0.y, r0.w, r0.y
					      dp2add r0.y, r1.yzzw, r1.yzzw, -r0.y
					      pow r1.y, r0.y, c11.z
					      cmp r0.y, r0.y, r1.y, c12.w
					      mad r0.x, r0.x, -c11.w, c11.y
					      mad r0.x, r0.x, c14.x, c14.y
					      lrp r1.y, r0.y, c1.z, r0.x
					      mul r1.x, r1.y, r1.x
					    endif
					    mul oC0.xyz, r0.z, r1.x
					    mov oC0.w, c1.z
					
					// approximately 321 instruction slots used (1 texture, 320 arithmetic)"
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
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					float u_xlat4;
					vec3 u_xlat5;
					int u_xlati5;
					bvec2 u_xlatb5;
					vec2 u_xlat6;
					float u_xlat7;
					bool u_xlatb7;
					vec2 u_xlat8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat10;
					bool u_xlatb11;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					bool u_xlatb13;
					float u_xlat14;
					bool u_xlatb14;
					void main()
					{
					    u_xlat0.x = _TimeX * 15.0;
					    u_xlat0.x = trunc(u_xlat0.x);
					    u_xlat0.y = 1.0;
					    u_xlat1.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat0.zw = u_xlat0.xx + vec2(23.0, 8.0);
					    u_xlat8.x = dot(u_xlat0.zy, vec2(12.9898005, 78.2330017));
					    u_xlat8.x = sin(u_xlat8.x);
					    u_xlat8.x = u_xlat8.x * 43758.5469;
					    u_xlat1.y = fract(u_xlat8.x);
					    u_xlat1.xy = u_xlat1.xy * vec2(0.00200000009, 0.00200000009) + vs_TEXCOORD0.xy;
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat8.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
					    u_xlat12 = dot(u_xlat0.wy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = sin(u_xlat12);
					    u_xlat8.xy = u_xlat8.xy * vec2(0.699999988, 43758.5469);
					    u_xlat12 = fract(u_xlat8.y);
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) + vec2(1.0, 1.0);
					    u_xlat9 = u_xlat1.x * vs_TEXCOORD0.x;
					    u_xlat9 = u_xlat9 * vs_TEXCOORD0.y;
					    u_xlat9 = u_xlat1.y * u_xlat9;
					    u_xlat9 = u_xlat9 * 16.0;
					    u_xlat13 = u_xlat12 + 0.5;
					    u_xlat13 = u_xlat13 * 0.300000012 + 0.699999988;
					    u_xlat2.xy = vec2(u_xlat12) * vec2(0.400000006, 8.0);
					    u_xlat9 = u_xlat9 * u_xlat13 + u_xlat2.x;
					    u_xlat9 = u_xlat9 + 1.0;
					    u_xlat13 = vs_TEXCOORD0.x * 16.0;
					    u_xlat1.x = u_xlat1.x * u_xlat13;
					    u_xlat1.x = u_xlat1.x * vs_TEXCOORD0.y;
					    u_xlat1.x = u_xlat1.y * u_xlat1.x;
					    u_xlat1.x = log2(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.400000006;
					    u_xlat1.x = exp2(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * u_xlat9;
					    u_xlati5 = int(u_xlat2.y);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    u_xlat2 = u_xlat0.xyxy + vec4(7.0, 0.0, 24.0, 0.0);
					    u_xlat13 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					    u_xlat13 = sin(u_xlat13);
					    u_xlat13 = u_xlat13 * 43758.5469;
					    u_xlat2.y = fract(u_xlat13);
					    u_xlat13 = u_xlat2.y * 0.00999999978;
					    u_xlat3 = u_xlat2.y + -0.5;
					    u_xlatb7 = 0.200000003<u_xlat2.y;
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat13 = u_xlat2.y * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat13 = u_xlat3 + u_xlat13;
					    u_xlat13 = log2(abs(u_xlat13));
					    u_xlat13 = u_xlat13 * 0.125;
					    u_xlat13 = exp2(u_xlat13);
					    u_xlat3 = (-u_xlat13) + 2.0;
					    u_xlat13 = (u_xlatb7) ? u_xlat13 : u_xlat3;
					    u_xlat13 = u_xlat13 * 0.5 + 0.5;
					    u_xlat13 = u_xlat13 * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.x) ? u_xlat13 : u_xlat1.x;
					    u_xlat5.x = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat13 = u_xlat5.x * 0.00999999978;
					    u_xlat10 = u_xlat5.x + -0.5;
					    u_xlatb14 = 0.200000003<u_xlat5.x;
					    u_xlat13 = u_xlat13 * vs_TEXCOORD0.y;
					    u_xlat5.x = u_xlat5.x * vs_TEXCOORD0.x + u_xlat13;
					    u_xlat5.x = u_xlat10 + u_xlat5.x;
					    u_xlat5.x = log2(abs(u_xlat5.x));
					    u_xlat5.x = u_xlat5.x * 0.125;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat13 = (-u_xlat5.x) + 2.0;
					    u_xlat5.x = (u_xlatb14) ? u_xlat5.x : u_xlat13;
					    u_xlat5.x = u_xlat5.x * 0.5 + 0.5;
					    u_xlat5.x = u_xlat5.x * u_xlat1.x;
					    u_xlat1.x = (u_xlatb5.y) ? u_xlat5.x : u_xlat1.x;
					    u_xlat5.xy = u_xlat0.xy + vec2(18.0, 0.0);
					    u_xlat5.x = dot(u_xlat5.xy, vec2(12.9898005, 78.2330017));
					    u_xlat5.x = sin(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 43758.5469;
					    u_xlat5.x = fract(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * 8.0 + -2.0;
					    u_xlat5.x = max(u_xlat5.x, 0.0);
					    u_xlati5 = int(u_xlat5.x);
					    u_xlatb5.xy = lessThan(ivec4(0, 1, 0, 0), ivec4(u_xlati5)).xy;
					    if(u_xlatb5.x){
					        u_xlat5.xz = u_xlat0.xy + vec2(6.0, 0.0);
					        u_xlat5.x = dot(u_xlat5.xz, vec2(12.9898005, 78.2330017));
					        u_xlat5.x = sin(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 43758.5469;
					        u_xlat2.x = fract(u_xlat5.x);
					        u_xlat5.x = u_xlat12 * 0.00999999978;
					        u_xlat6.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat13 = u_xlat6.y / u_xlat6.x;
					        u_xlat14 = min(abs(u_xlat13), 1.0);
					        u_xlat3 = max(abs(u_xlat13), 1.0);
					        u_xlat3 = float(1.0) / u_xlat3;
					        u_xlat14 = u_xlat14 * u_xlat3;
					        u_xlat3 = u_xlat14 * u_xlat14;
					        u_xlat7 = u_xlat3 * 0.0208350997 + -0.0851330012;
					        u_xlat7 = u_xlat3 * u_xlat7 + 0.180141002;
					        u_xlat7 = u_xlat3 * u_xlat7 + -0.330299497;
					        u_xlat3 = u_xlat3 * u_xlat7 + 0.999866009;
					        u_xlat7 = u_xlat14 * u_xlat3;
					        u_xlatb11 = 1.0<abs(u_xlat13);
					        u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
					        u_xlat7 = u_xlatb11 ? u_xlat7 : float(0.0);
					        u_xlat14 = u_xlat14 * u_xlat3 + u_xlat7;
					        u_xlat13 = min(u_xlat13, 1.0);
					        u_xlatb13 = u_xlat13<(-u_xlat13);
					        u_xlat13 = (u_xlatb13) ? (-u_xlat14) : u_xlat14;
					        u_xlat5.x = u_xlat5.x * u_xlat5.x;
					        u_xlat13 = u_xlat13 * u_xlat2.x;
					        u_xlat13 = u_xlat13 * 6.28310013;
					        u_xlat13 = sin(u_xlat13);
					        u_xlat13 = u_xlat13 * 0.100000001 + 1.0;
					        u_xlat2.x = u_xlat13 * u_xlat5.x;
					        u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					        u_xlatb2 = u_xlat6.x<u_xlat2.x;
					        u_xlat5.x = (-u_xlat5.x) * u_xlat13 + u_xlat6.x;
					        u_xlat5.x = log2(u_xlat5.x);
					        u_xlat5.x = u_xlat5.x * 0.0625;
					        u_xlat5.x = exp2(u_xlat5.x);
					        u_xlat5.x = (u_xlatb2) ? 0.200000003 : u_xlat5.x;
					        u_xlat12 = (-u_xlat12) * 0.5 + 1.0;
					        u_xlat12 = u_xlat12 * 0.200000003 + 0.300000012;
					        u_xlat13 = (-u_xlat12) + 1.0;
					        u_xlat12 = u_xlat5.x * u_xlat13 + u_xlat12;
					        u_xlat1.x = u_xlat12 * u_xlat1.x;
					    }
					    if(u_xlatb5.y){
					        u_xlat2 = u_xlat0.xyxy + vec4(25.0, 0.0, 26.0, 0.0);
					        u_xlat12 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.x = fract(u_xlat12);
					        u_xlat12 = dot(u_xlat2.zw, vec2(12.9898005, 78.2330017));
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 43758.5469;
					        u_xlat2.y = fract(u_xlat12);
					        u_xlat0.xy = u_xlat0.xy + vec2(27.0, 0.0);
					        u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
					        u_xlat0.x = sin(u_xlat0.x);
					        u_xlat0.x = u_xlat0.x * 43758.5469;
					        u_xlat0.x = fract(u_xlat0.x);
					        u_xlat4 = u_xlat0.x * 0.00999999978;
					        u_xlat5.xy = u_xlat2.xy + (-vs_TEXCOORD0.xy);
					        u_xlat12 = u_xlat5.y / u_xlat5.x;
					        u_xlat13 = min(abs(u_xlat12), 1.0);
					        u_xlat6.x = max(abs(u_xlat12), 1.0);
					        u_xlat6.x = float(1.0) / u_xlat6.x;
					        u_xlat13 = u_xlat13 * u_xlat6.x;
					        u_xlat6.x = u_xlat13 * u_xlat13;
					        u_xlat10 = u_xlat6.x * 0.0208350997 + -0.0851330012;
					        u_xlat10 = u_xlat6.x * u_xlat10 + 0.180141002;
					        u_xlat10 = u_xlat6.x * u_xlat10 + -0.330299497;
					        u_xlat6.x = u_xlat6.x * u_xlat10 + 0.999866009;
					        u_xlat10 = u_xlat13 * u_xlat6.x;
					        u_xlatb14 = 1.0<abs(u_xlat12);
					        u_xlat10 = u_xlat10 * -2.0 + 1.57079637;
					        u_xlat10 = u_xlatb14 ? u_xlat10 : float(0.0);
					        u_xlat13 = u_xlat13 * u_xlat6.x + u_xlat10;
					        u_xlat12 = min(u_xlat12, 1.0);
					        u_xlatb12 = u_xlat12<(-u_xlat12);
					        u_xlat12 = (u_xlatb12) ? (-u_xlat13) : u_xlat13;
					        u_xlat4 = u_xlat4 * u_xlat4;
					        u_xlat12 = u_xlat12 * u_xlat2.x;
					        u_xlat12 = u_xlat12 * 6.28310013;
					        u_xlat12 = sin(u_xlat12);
					        u_xlat12 = u_xlat12 * 0.100000001 + 1.0;
					        u_xlat13 = u_xlat12 * u_xlat4;
					        u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					        u_xlatb9 = u_xlat5.x<u_xlat13;
					        u_xlat4 = (-u_xlat4) * u_xlat12 + u_xlat5.x;
					        u_xlat4 = log2(u_xlat4);
					        u_xlat4 = u_xlat4 * 0.0625;
					        u_xlat4 = exp2(u_xlat4);
					        u_xlat4 = (u_xlatb9) ? 0.200000003 : u_xlat4;
					        u_xlat0.x = (-u_xlat0.x) * 0.5 + 1.0;
					        u_xlat0.x = u_xlat0.x * 0.200000003 + 0.300000012;
					        u_xlat12 = (-u_xlat0.x) + 1.0;
					        u_xlat0.x = u_xlat4 * u_xlat12 + u_xlat0.x;
					        u_xlat1.x = u_xlat0.x * u_xlat1.x;
					    }
					    SV_Target0.xyz = u_xlat8.xxx * u_xlat1.xxx;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}