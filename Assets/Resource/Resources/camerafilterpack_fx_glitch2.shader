Shader "CameraFilterPack/FX_Glitch2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 45304
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
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c0, 1, 59, 60, 256
					    def c1, 4.99999987e-005, 0.000449999992, 500000, 4.50000007e-005
					    def c2, 0.25, 0.349999994, 1.10317802, 0.5
					    def c3, 6.28318548, -3.14159274, 200, 40005
					    def c4, 0.5, 100.050003, -0.5, -1
					    def c5, 0.159154937, 0.5, 59, 43812.1758
					    def c6, 2, 3, 8.74227766e-008, 6.23839998
					    def c7, -0.200000003, -0.400000006, -0.600000024, -0.800000012
					    def c8, 0.159154937, 28.4887352, 0.358098626, 0.134772405
					    def c9, 257, 315, 316, 0
					    def c10, 0.992808521, 0.5, 0, 0
					    dcl_texcoord_pp v0.xy
					    dcl_2d s0
					    texld r0, c4.x, s0
					    add r0.y, r0.x, c4.w
					    add r1, c4.yzzz, v0.xyxy
					    mul r2, r1.zwzw, c1.zzww
					    cmp r0.yz, r0.y, r1.xzww, r2.xzww
					    add r3, r0.x, c7
					    mov r4.x, c4.x
					    mad r4, r0.x, c8, r4.x
					    frc r4, r4
					    mad r4, r4, c3.x, c3.y
					    cmp r0.xy, r3.w, r0.yzzw, r2
					    mul r2, r1, c1.xxyy
					    cmp r0.xy, r3.z, r0, r2.zwzw
					    cmp r0.xy, r3.y, r0, r2
					    cmp r0.xy, r3.x, r0, r1.zwzw
					    mov r0.zw, c2.xyxy
					    texld r1, r0.xzzw, s0
					    texld r2, r0.xwzw, s0
					    mad r0.z, r2.x, c5.x, c5.y
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c3.x, c3.y
					    sincos r2.y, r0.z
					    log r0.z, r1.x
					    mad r0.z, r0.z, c2.z, c2.w
					    frc r0.z, r0.z
					    mad r0.z, r0.z, c3.x, c3.y
					    sincos r1.y, r0.z
					    mul r0.z, r1.y, c3.z
					    mul r0.yz, r0.z, r0.xxyw
					    sincos r1.x, r4.x
					    mad r0.w, r0.z, c3.w, r1.x
					    mad r0.w, r0.w, c5.x, c5.y
					    frc r0.w, r0.w
					    mad r0.w, r0.w, c3.x, c3.y
					    sincos r3.y, r0.w
					    mad r0.w, r2.y, r3.y, r0.y
					    add r1.y, r2.y, c4.z
					    cmp r0.x, r1.y, r0.y, r0.w
					    sincos r2.y, r4.y
					    mul r0.xy, r0.xzzw, r2.y
					    frc r0.zw, r0.xyxy
					    add r0.xy, -r0.zwzw, r0
					    mad r0.x, r0.y, c5.z, r0.x
					    mad r0.y, r0.x, c5.x, c5.y
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c3.x, c3.y
					    sincos r2.y, r0.y
					    mul r0.y, r2.y, c5.w
					    add r2, r0.x, c0
					    add r1.yzw, r0.x, c9.xxyz
					    mad r1.yzw, r1, c5.x, c5.y
					    frc r1.yzw, r1
					    mad r1.yzw, r1, c3.x, c3.y
					    mad r2, r2, c5.x, c5.y
					    frc r2, r2
					    mad r2, r2, c3.x, c3.y
					    sincos r3.y, r2.x
					    mul r0.x, r3.y, c5.w
					    frc r0.xy, r0
					    mul r3.xy, r0.zwzw, r0.zwzw
					    mad r0.zw, r0, -c6.x, c6.y
					    mul r0.zw, r0, r3.xyxy
					    lrp r2.x, r0.z, r0.x, r0.y
					    sincos r3.y, r2.y
					    mul r0.x, r3.y, c5.w
					    sincos r3.y, r2.z
					    sincos r5.y, r2.w
					    mul r0.y, r5.y, c5.w
					    frc r0.xy, r0
					    mul r2.y, r3.y, c5.w
					    frc r2.y, r2.y
					    lrp r3.x, r0.z, r2.y, r0.x
					    lrp r4.x, r0.w, r3.x, r2.x
					    sincos r2.y, r1.z
					    mul r0.x, r2.y, c5.w
					    sincos r2.y, r1.w
					    sincos r3.y, r1.y
					    mul r1.y, r3.y, c5.w
					    frc r1.y, r1.y
					    lrp r2.x, r0.z, r1.y, r0.y
					    mul r0.y, r2.y, c5.w
					    frc r0.xy, r0
					    lrp r1.y, r0.z, r0.y, r0.x
					    lrp r3.x, r0.w, r1.y, r2.x
					    lrp r0.x, c6.z, r3.x, r4.x
					    mul r0.y, r1.x, r0.x
					    mul r0.x, r0.x, c6.w
					    mad r0.y, r0.y, c10.x, c10.y
					    frc r0.y, r0.y
					    mad r0.y, r0.y, c3.x, c3.y
					    sincos r1.y, r0.y
					    mul r0.y, r1.y, c5.w
					    frc r1.x, r0.y
					    sincos r2.x, r4.z
					    sincos r3.x, r4.w
					    mad r0.y, r3.x, -c7.w, r0.x
					    mad r0.x, r2.x, -c7.y, r0.x
					    mad r0.x, r0.x, c5.x, c5.y
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c3.x, c3.y
					    sincos r2.y, r0.x
					    mul r0.x, r2.y, c5.w
					    frc r1.y, r0.x
					    mad r0.x, r0.y, c5.x, c5.y
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c3.x, c3.y
					    sincos r2.y, r0.x
					    mul r0.x, r2.y, c5.w
					    frc r1.z, r0.x
					    texld r0, v0, s0
					    mul oC0.xyz, r0, r1
					    mov oC0.w, -c4.w
					
					// approximately 238 instruction slots used (4 texture, 234 arithmetic)"
				}
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bvec4 u_xlatb3;
					vec3 u_xlat4;
					bool u_xlatb4;
					float u_xlat8;
					vec2 u_xlat9;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vec2(0.5, 0.5));
					    u_xlatb4 = u_xlat0.x<1.0;
					    u_xlat1 = vs_TEXCOORD0.xyxy + vec4(100.050003, -0.5, -0.5, -0.5);
					    u_xlat2 = u_xlat1.zwzw * vec4(500000.0, 500000.0, 4.50000007e-05, 4.50000007e-05);
					    u_xlat4.xy = (bool(u_xlatb4)) ? u_xlat2.zw : u_xlat1.zw;
					    u_xlatb3 = lessThan(u_xlat0.xxxx, vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012));
					    u_xlat4.xy = (u_xlatb3.w) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat2 = u_xlat1 * vec4(4.99999987e-05, 4.99999987e-05, 0.000449999992, 0.000449999992);
					    u_xlat4.xy = (u_xlatb3.z) ? u_xlat2.zw : u_xlat4.xy;
					    u_xlat4.xy = (u_xlatb3.y) ? u_xlat2.xy : u_xlat4.xy;
					    u_xlat1.xy = (u_xlatb3.x) ? u_xlat1.zw : u_xlat4.xy;
					    u_xlat1.z = float(0.25);
					    u_xlat1.w = float(0.349999994);
					    u_xlat2 = texture(_MainTex, u_xlat1.xz);
					    u_xlat3 = texture(_MainTex, u_xlat1.xw);
					    u_xlat4.x = sin(u_xlat3.x);
					    u_xlat8 = log2(u_xlat2.x);
					    u_xlat8 = u_xlat8 * 6.93147182;
					    u_xlat8 = sin(u_xlat8);
					    u_xlat8 = u_xlat8 * 200.0;
					    u_xlat1.yz = vec2(u_xlat8) * u_xlat1.xy;
					    u_xlat8 = cos(u_xlat0.x);
					    u_xlat2.xyz = u_xlat0.xxx * vec3(179.0, 2.25, 0.846800029);
					    u_xlat0.x = u_xlat1.z * 40005.0 + u_xlat8;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat4.x * u_xlat0.x + u_xlat1.y;
					    u_xlatb4 = u_xlat4.x<0.5;
					    u_xlat1.x = (u_xlatb4) ? u_xlat0.x : u_xlat1.y;
					    u_xlat0.x = sin(u_xlat2.x);
					    u_xlat0.yw = cos(u_xlat2.yz);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xz;
					    u_xlat9.xy = fract(u_xlat1.xy);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat1.xy = u_xlat9.xy * u_xlat9.xy;
					    u_xlat9.xy = (-u_xlat9.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat9.xy * u_xlat1.xy;
					    u_xlat2.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(43812.1758, 0.400000006, 0.800000012);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.xyz = sin(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat2.xyz = fract(u_xlat2.xyz);
					    u_xlat9.x = (-u_xlat2.y) + u_xlat2.z;
					    u_xlat9.x = u_xlat1.x * u_xlat9.x + u_xlat2.y;
					    u_xlat13 = (-u_xlat0.x) + u_xlat2.x;
					    u_xlat0.x = u_xlat1.x * u_xlat13 + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat9.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat4.xz = u_xlat0.xx * vec2(6.23839998, 6.23839998) + u_xlat0.yw;
					    u_xlat0.x = u_xlat8 * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 6.23799992;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43812.1758;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = sin(u_xlat4.xz);
					    u_xlat0.xy = u_xlat0.xy * vec2(43812.1758, 43812.1758);
					    u_xlat1.yz = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}