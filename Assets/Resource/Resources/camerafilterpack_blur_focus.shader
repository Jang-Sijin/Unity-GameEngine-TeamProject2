Shader "CameraFilterPack/Blur_Focus" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Size ("Size", Range(0, 1)) = 1
		_Circle ("Circle", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_CenterX ("_CenterX", Range(-1, 1)) = 0
		_CenterY ("_CenterY", Range(-1, 1)) = 0
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 32559
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
					//   float _CenterX;
					//   float _CenterY;
					//   float _Circle;
					//   sampler2D _MainTex;
					//   float _Size;
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _CenterX     c0       1
					//   _CenterY     c1       1
					//   _Circle      c2       1
					//   _Size        c3       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c4, 0.5, 0, 0, 0.200000003
					    def c5, 5, 1, 0, 0
					    defi i0, 255, 0, 0, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    rcp r0.x, c2.x
					    mov r1.xzw, c4.xyyy
					    mad r0.y, c0.x, r1.x, r1.x
					    mad r0.z, c1.x, r1.x, r1.x
					    mov r1.xy, -r0.yzzw
					    add r0.yz, r1.xxyw, v0.xxyw
					    dp2add r0.w, r0.yzzw, r0.yzzw, c4.y
					    mul r0.yz, r0.w, r0
					    mov_pp r2.xyz, c4.y
					    mov r0.w, c4.y
					    rep i0
					      break_ge r0.w, c3.x
					      mul r2.w, r0.x, r0.w
					      mad r1.xy, r0.yzzw, r2.w, v0
					      texldl_pp r3, r1, s0
					      add_pp r2.xyz, r2, r3
					      add r0.w, r0.w, c4.w
					    endrep
					    mov r0.x, c3.x
					    mul r0.x, r0.x, c5.x
					    rcp r0.x, r0.x
					    mul_pp oC0.xyz, r0.x, r2
					    mov oC0.w, c5.y
					
					// approximately 30 instruction slots used (2 texture, 28 arithmetic)"
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
						float _CenterX;
						float _CenterY;
						float _Circle;
						float _Size;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec2 u_xlat3;
					float u_xlat9;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = _Size * 5.0;
					    u_xlat3.xy = vec2(_CenterX, _CenterY) * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
					    u_xlat9 = dot(u_xlat3.xy, u_xlat3.xy);
					    u_xlat3.xy = vec2(u_xlat9) * u_xlat3.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat9 = 0.0;
					    while(true){
					        u_xlatb10 = u_xlat9>=_Size;
					        if(u_xlatb10){break;}
					        u_xlat10 = u_xlat9 / _Circle;
					        u_xlat2.xy = u_xlat3.xy * vec2(u_xlat10) + vs_TEXCOORD0.xy;
					        u_xlat2 = textureLod(_MainTex, u_xlat2.xy, 0.0);
					        u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					        u_xlat9 = u_xlat9 + 0.200000003;
					    }
					    SV_Target0.xyz = u_xlat1.xyz / vec3(u_xlat0);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}