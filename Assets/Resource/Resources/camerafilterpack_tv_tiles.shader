Shader "CameraFilterPack/TV_Tiles" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 50051
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
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c5, 256, 0.5, 0, 1
					    def c6, 7, 31, 0.159154937, 0.5
					    def c7, 6.28318548, -3.14159274, 13.5453167, -0.449999988
					    def c8, 0.0350000001, 0.00999999978, 0, 0.699999988
					    def c9, 9.99999809, 16, 2.5, 0
					    def c10, -2, 3, 0.00999999978, 0
					    def c11, 1, 0.699999988, 0, 0
					    defi i0, 6, 0, 0, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mov r0.x, c5.x
					    mad r0.xy, v0, r0.x, c0.x
					    texld r1, v0, s0
					    add r0.zw, c5.y, -v0.xyxy
					    dp2add r0.z, r0.zwzw, r0.zwzw, c5.z
					    rsq r0.z, r0.z
					    rcp r0.z, r0.z
					    add r0.z, r0.z, -c3.x
					    rcp r0.w, -c4.x
					    mul_sat r0.z, r0.w, r0.z
					    mad r0.w, r0.z, c10.x, c10.y
					    mul r0.z, r0.z, r0.z
					    mad r0.z, r0.w, -r0.z, c5.w
					    mov r2.z, c10.z
					    mul r0.w, r2.z, c0.x
					    add r1.w, c1.x, c1.x
					    rcp r1.w, r1.w
					    mov r2.xyz, c5.z
					    mov r3.xy, r0
					    rep i0
					      frc r3.zw, r3.xyxy
					      add r4.xy, -r3.zwzw, r3
					      dp2add r2.w, r4, c6, r0.w
					      mad r2.w, r2.w, c6.z, c6.w
					      frc r2.w, r2.w
					      mad r2.w, r2.w, c7.x, c7.y
					      sincos r4.y, r2.w
					      add r4, r4.y, c8
					      mul r4, r4, c7.z
					      frc r4, r4
					      add r2.w, r4.w, c7.w
					      mul_sat r2.w, r2.w, c9.x
					      mad r4.w, r2.w, c10.x, c10.y
					      mul r2.w, r2.w, r2.w
					      mul r2.w, r2.w, r4.w
					      mul r4.xyz, r2.w, r4
					      mul r2.w, r3.z, r3.w
					      mul r2.w, r2.w, c9.y
					      add r3.zw, -r3, c5.w
					      mul r2.w, r2.w, r3.z
					      mul r2.w, r3.w, r2.w
					      rsq r2.w, r2.w
					      rcp r2.w, r2.w
					      mad r4.xyz, r4, r2.w, r2
					      mul r3.xy, r1.w, r3
					      mul r2.xyz, r4, c5.y
					    endrep
					    mul r0.xyw, r2.xyzz, c9.z
					    log r2.x, r0.x
					    log r2.y, r0.y
					    log r2.z, r0.w
					    mul r0.xyw, r2.xyzz, c11.xxzy
					    exp r2.x, r0.x
					    exp r2.y, r0.y
					    exp r2.z, r0.w
					    mul r0.xyw, r2.xyzz, c2.x
					    mad r0.xyw, r1.xyzz, r0, -r1.xyzz
					    mad oC0.xyz, r0.z, r0.xyww, r1
					    mov oC0.w, c5.w
					
					// approximately 71 instruction slots used (1 texture, 70 arithmetic)"
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
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat12;
					vec2 u_xlat15;
					float u_xlat18;
					int u_xlati19;
					float u_xlat20;
					bool u_xlatb20;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(256.0, 256.0) + vec2(_TimeX);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat12.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
					    u_xlat12.x = sqrt(u_xlat12.x);
					    u_xlat12.x = u_xlat12.x + (-_Value3);
					    u_xlat18 = float(1.0) / (-_Value4);
					    u_xlat12.x = u_xlat18 * u_xlat12.x;
					    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
					    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
					    u_xlat12.x = u_xlat12.x * u_xlat12.x;
					    u_xlat12.x = (-u_xlat18) * u_xlat12.x + 1.0;
					    u_xlat18 = _Value + _Value;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    u_xlat3.xy = u_xlat0.xy;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat15.xy = floor(u_xlat3.xy);
					        u_xlat4.xy = fract(u_xlat3.xy);
					        u_xlat20 = dot(u_xlat15.xy, vec2(7.0, 31.0));
					        u_xlat20 = _TimeX * 0.00999999978 + u_xlat20;
					        u_xlat20 = sin(u_xlat20);
					        u_xlat5 = vec4(u_xlat20) + vec4(0.0350000001, 0.00999999978, 0.0, 0.699999988);
					        u_xlat5 = u_xlat5 * vec4(13.5453167, 13.5453167, 13.5453167, 13.5453167);
					        u_xlat5 = fract(u_xlat5);
					        u_xlat20 = u_xlat5.w + -0.449999988;
					        u_xlat20 = u_xlat20 * 9.99999809;
					        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					        u_xlat15.x = u_xlat20 * -2.0 + 3.0;
					        u_xlat20 = u_xlat20 * u_xlat20;
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat5.xyz = vec3(u_xlat20) * u_xlat5.xyz;
					        u_xlat20 = u_xlat4.x * u_xlat4.y;
					        u_xlat20 = u_xlat20 * 16.0;
					        u_xlat15.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					        u_xlat20 = u_xlat20 * u_xlat15.x;
					        u_xlat20 = u_xlat15.y * u_xlat20;
					        u_xlat20 = sqrt(u_xlat20);
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat20) + u_xlat2.xyz;
					        u_xlat3.xy = u_xlat3.xy / vec2(u_xlat18);
					        u_xlat2.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5);
					    }
					    u_xlat0.xyw = u_xlat2.xyz * vec3(2.5, 2.5, 2.5);
					    u_xlat0.xyw = log2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(1.0, 1.0, 0.699999988);
					    u_xlat0.xyw = exp2(u_xlat0.xyw);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat0.xyw = u_xlat1.xyz * u_xlat0.xyw + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat12.xxx * u_xlat0.xyw + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}