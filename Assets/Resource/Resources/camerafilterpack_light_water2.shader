Shader "CameraFilterPack/Light_Water2" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 29197
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
					    def c5, 1.29999995, 0, 0, 1
					    def c6, 0.142857149, 0.5, 6.28318548, -3.14159274
					    def c7, 0.95492965, 0.5, 0.159154937, 8.52999973
					    def c8, 0.00833333377, 0.0166666675, 700, 1
					    def c9, 0.00833333377, -0.0120000001, 200000, 0
					    defi i0, 8, 0, 0, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mov r0.x, c5.x
					    mul r0.x, r0.x, c0.x
					    mul r0.y, r0.x, c2.x
					    mul r0.z, r0.x, c3.x
					    mov r1.xy, c5.z
					    rep i0
					      mad r0.w, r1.y, c6.x, c6.y
					      frc r0.w, r0.w
					      mad r0.w, r0.w, c6.z, c6.w
					      sincos r2.xy, r0.w
					      mul r1.zw, r0.x, r2.xyxy
					      mad r0.w, r1.z, c1.x, r0.y
					      add r0.w, r0.w, v0.x
					      mad r1.z, r1.w, c1.x, -r0.z
					      add r1.z, -r1.z, v0.y
					      mul r1.z, r2.y, r1.z
					      mad r0.w, r0.w, r2.x, -r1.z
					      mad r0.w, r0.w, c7.x, c7.y
					      frc r0.w, r0.w
					      mad r0.w, r0.w, c6.z, c6.w
					      sincos r2.x, r0.w
					      mad r1.x, r2.x, c4.x, r1.x
					      add r1.y, r1.y, c5.w
					    endrep
					    mad r0.w, r1.x, c7.z, c7.y
					    frc r0.w, r0.w
					    mad r0.w, r0.w, c6.z, c6.w
					    sincos r1.x, r0.w
					    add r1.yz, c7.w, v0.xxyw
					    mov r2.xy, c5.z
					    rep i0
					      mad r0.w, r2.y, c6.x, c6.y
					      frc r0.w, r0.w
					      mad r0.w, r0.w, c6.z, c6.w
					      sincos r3.xy, r0.w
					      mul r2.zw, r0.x, r3.xyxy
					      mad r0.w, r2.z, c1.x, r0.y
					      add r0.w, r0.w, r1.y
					      mad r1.w, r2.w, c1.x, -r0.z
					      add r1.w, -r1.w, v0.y
					      mul r1.w, r3.y, r1.w
					      mad r0.w, r0.w, r3.x, -r1.w
					      mad r0.w, r0.w, c7.x, c7.y
					      frc r0.w, r0.w
					      mad r0.w, r0.w, c6.z, c6.w
					      sincos r3.x, r0.w
					      mad r2.x, r3.x, c4.x, r2.x
					      add r2.y, r2.y, c5.w
					    endrep
					    mad r0.w, r2.x, c7.z, c7.y
					    frc r0.w, r0.w
					    mad r0.w, r0.w, c6.z, c6.w
					    sincos r2.x, r0.w
					    add r0.w, r1.x, -r2.x
					    mov r1.yw, c5.z
					    rep i0
					      mad r2.x, r1.w, c6.x, c6.y
					      frc r2.x, r2.x
					      mad r2.x, r2.x, c6.z, c6.w
					      sincos r3.xy, r2.x
					      mul r2.xy, r0.x, r3
					      mad r2.x, r2.x, c1.x, r0.y
					      add r2.x, r2.x, v0.x
					      mad r2.y, r2.y, c1.x, -r0.z
					      add r2.y, r1.z, -r2.y
					      mul r2.y, r3.y, r2.y
					      mad r2.x, r2.x, r3.x, -r2.y
					      mad r2.x, r2.x, c7.x, c7.y
					      frc r2.x, r2.x
					      mad r2.x, r2.x, c6.z, c6.w
					      sincos r3.x, r2.x
					      mad r1.y, r3.x, c4.x, r1.y
					      add r1.w, r1.w, c5.w
					    endrep
					    mad r0.x, r1.y, c7.z, c7.y
					    frc r0.x, r0.x
					    mad r0.x, r0.x, c6.z, c6.w
					    sincos r2.x, r0.x
					    add r0.x, r1.x, -r2.x
					    mad r1.x, r0.w, c8.y, v0.x
					    mul r0.yz, r0.xwxw, c8.x
					    mad r1.y, r0.x, c8.y, v0.y
					    mul r0.y, r0.z, r0.y
					    mad r0.y, r0.y, c8.z, c8.w
					    mad r0.z, r0.w, c9.x, c9.y
					    mad r0.x, r0.x, c9.x, c9.y
					    mul r0.w, r0.x, r0.z
					    mul r0.w, r0.w, c9.z
					    pow r1.z, r0.y, r0.w
					    cmp r0.x, -r0.x, -c5.z, -c5.w
					    cmp r0.x, -r0.z, c5.z, r0.x
					    cmp r0.x, r0.x, r0.y, r1.z
					    texld r1, r1, s0
					    mul oC0, r0.x, r1
					
					// approximately 168 instruction slots used (1 texture, 167 arithmetic)"
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
					float u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					bool u_xlatb1;
					vec2 u_xlat2;
					bool u_xlatb2;
					float u_xlat3;
					vec2 u_xlat4;
					float u_xlat5;
					bool u_xlatb5;
					float u_xlat6;
					float u_xlat8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					bool u_xlatb12;
					int u_xlati13;
					void main()
					{
					    u_xlat0 = _TimeX * 1.29999995;
					    u_xlat4.xy = vec2(u_xlat0) * vec2(_Value2, _Value3);
					    u_xlat12 = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat5 = float(u_xlati_loop_1);
					        u_xlat5 = u_xlat5 * 0.897597909;
					        u_xlat2.x = sin(u_xlat5);
					        u_xlat3 = cos(u_xlat5);
					        u_xlat5 = u_xlat0 * u_xlat3;
					        u_xlat5 = u_xlat5 * _Value + u_xlat4.x;
					        u_xlat5 = u_xlat5 + vs_TEXCOORD0.x;
					        u_xlat9 = u_xlat0 * u_xlat2.x;
					        u_xlat9 = u_xlat9 * _Value + (-u_xlat4.y);
					        u_xlat9 = (-u_xlat9) + vs_TEXCOORD0.y;
					        u_xlat9 = u_xlat2.x * u_xlat9;
					        u_xlat5 = u_xlat5 * u_xlat3 + (-u_xlat9);
					        u_xlat5 = u_xlat5 * 6.0;
					        u_xlat5 = cos(u_xlat5);
					        u_xlat12 = u_xlat5 * _Value4 + u_xlat12;
					    }
					    u_xlat12 = cos(u_xlat12);
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat2.x = float(u_xlati_loop_2);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat1.x + u_xlat6;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = (-u_xlat10) + vs_TEXCOORD0.y;
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat1.x = cos(u_xlat9);
					    u_xlat1.x = u_xlat12 + (-u_xlat1.x);
					    u_xlat9 = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat2.x = float(u_xlati_loop_3);
					        u_xlat2.x = u_xlat2.x * 0.897597909;
					        u_xlat3 = cos(u_xlat2.x);
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat6 = u_xlat0 * u_xlat3;
					        u_xlat6 = u_xlat6 * _Value + u_xlat4.x;
					        u_xlat6 = u_xlat6 + vs_TEXCOORD0.x;
					        u_xlat10 = u_xlat0 * u_xlat2.x;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat4.y);
					        u_xlat10 = u_xlat1.y + (-u_xlat10);
					        u_xlat2.x = u_xlat2.x * u_xlat10;
					        u_xlat2.x = u_xlat6 * u_xlat3 + (-u_xlat2.x);
					        u_xlat2.x = u_xlat2.x * 6.0;
					        u_xlat2.x = cos(u_xlat2.x);
					        u_xlat9 = u_xlat2.x * _Value4 + u_xlat9;
					    }
					    u_xlat0 = cos(u_xlat9);
					    u_xlat0 = (-u_xlat0) + u_xlat12;
					    u_xlat4.x = u_xlat1.x * 0.00833333377;
					    u_xlat2.x = u_xlat1.x * 0.0166666675 + vs_TEXCOORD0.x;
					    u_xlat8 = u_xlat0 * 0.00833333377;
					    u_xlat2.y = u_xlat0 * 0.0166666675 + vs_TEXCOORD0.y;
					    u_xlat4.x = u_xlat8 * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * 700.0 + 1.0;
					    u_xlat8 = u_xlat1.x * 0.00833333377 + -0.0120000001;
					    u_xlat0 = u_xlat0 * 0.00833333377 + -0.0120000001;
					    u_xlatb12 = 0.0<u_xlat8;
					    u_xlatb1 = 0.0<u_xlat0;
					    u_xlatb12 = u_xlatb12 && u_xlatb1;
					    u_xlat0 = u_xlat0 * u_xlat8;
					    u_xlat0 = u_xlat0 * 200000.0;
					    u_xlat8 = log2(u_xlat4.x);
					    u_xlat0 = u_xlat8 * u_xlat0;
					    u_xlat0 = exp2(u_xlat0);
					    u_xlat0 = (u_xlatb12) ? u_xlat0 : u_xlat4.x;
					    u_xlat1 = texture(_MainTex, u_xlat2.xy);
					    SV_Target0 = vec4(u_xlat0) * u_xlat1;
					    return;
					}"
				}
			}
		}
	}
}