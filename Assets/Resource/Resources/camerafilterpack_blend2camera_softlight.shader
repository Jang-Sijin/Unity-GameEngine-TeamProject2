Shader "CameraFilterPack/Blend2Camera_SoftLight" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 9378
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
					//   float _Value;
					//   float _Value2;
					//
					//
					// Registers:
					//
					//   Name               Reg   Size
					//   ------------------ ----- ----
					//   _Value             c0       1
					//   _Value2            c1       1
					//   _MainTex_TexelSize c2       1
					//   _MainTex           s0       1
					//   _MainTex2          s1       1
					//
					
					    ps_3_0
					    def c3, 2, -1, 16, -12
					    def c4, 3, 0, 0, 0
					    def c5, 1, -0.5, 2, -0.25
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    dcl_2d s1
					    mov r0.x, c5.x
					    add r0.x, r0.x, -c1.x
					    add r0.y, c5.x, -v0.y
					    cmp r1.y, c2.y, v0.y, r0.y
					    mov r1.x, v0.x
					    texld r1, r1, s1
					    texld r2, v0, s0
					    add r0.yzw, r1.xxyz, -r2.xxyz
					    lrp r3.xyz, c1.x, r1, r2
					    mad r0.xyz, r0.x, r0.yzww, r2
					    mad r1.xyz, r0, c3.z, c3.w
					    mad r1.xyz, r1, r0, c4.x
					    mad r2.xyz, r3, c3.x, c3.y
					    mul r4.xyz, r0, r2
					    mad r1.xyz, r4, r1, r0
					    rsq r0.w, r0.x
					    rcp r0.w, r0.w
					    lrp r1.w, r2.x, r0.w, r0.x
					    add r4.xyz, r0, c5.w
					    cmp r0.w, r4.x, r1.w, r1.x
					    add r5.xyz, r3, c5.y
					    mad r6.xyz, r3, -c5.z, c5.x
					    mul r6.xyz, r0, r6
					    add r7.xyz, -r0, c5.x
					    mad r6.xyz, r6, -r7, r0
					    rsq r0.x, r0.y
					    rcp r0.x, r0.x
					    lrp r1.x, r2.y, r0.x, r0.y
					    cmp r0.x, r4.y, r1.x, r1.y
					    cmp r7.xy, r5, r0.wxzw, r6
					    rsq r0.x, r0.z
					    rcp r0.x, r0.x
					    lrp r1.x, r2.z, r0.x, r0.z
					    cmp r0.x, r4.z, r1.x, r1.z
					    cmp r7.z, r5.z, r0.x, r6.z
					    add r0.xyz, -r3, r7
					    mad oC0.xyz, c0.x, r0, r3
					    mov oC0.w, c5.x
					
					// approximately 38 instruction slots used (2 texture, 36 arithmetic)"
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
						float _Value2;
						vec4 unused_0_3;
						vec2 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _MainTex2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bvec3 u_xlatb3;
					vec3 u_xlat4;
					bvec3 u_xlatb4;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat18;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat6 = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat0.y = (u_xlatb0) ? u_xlat6 : vs_TEXCOORD0.y;
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat0 = texture(_MainTex2, u_xlat0.xy);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
					    u_xlat18 = (-_Value2) + 1.0;
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = vec3(vec3(_Value2, _Value2, _Value2)) * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * vec3(16.0, 16.0, 16.0) + vec3(-12.0, -12.0, -12.0);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(3.0, 3.0, 3.0);
					    u_xlat3.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat4.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat4.xyz = sqrt(u_xlat2.xyz);
					    u_xlat4.xyz = (-u_xlat2.xyz) + u_xlat4.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat2.xyz;
					    u_xlatb4.xyz = lessThan(u_xlat2.xyzx, vec4(0.25, 0.25, 0.25, 0.0)).xyz;
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb4.x) ? u_xlat1.x : u_xlat3.x;
					        hlslcc_movcTemp.y = (u_xlatb4.y) ? u_xlat1.y : u_xlat3.y;
					        hlslcc_movcTemp.z = (u_xlatb4.z) ? u_xlat1.z : u_xlat3.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlatb3.xyz = lessThan(u_xlat0.xyzx, vec4(0.5, 0.5, 0.5, 0.0)).xyz;
					    u_xlat4.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
					    u_xlat5.xyz = (-u_xlat0.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat5.xyz;
					    u_xlat2.xyz = (-u_xlat5.xyz) * u_xlat4.xyz + u_xlat2.xyz;
					    {
					        vec4 hlslcc_movcTemp = u_xlat1;
					        hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat2.x : u_xlat1.x;
					        hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat2.y : u_xlat1.y;
					        hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat2.z : u_xlat1.z;
					        u_xlat1 = hlslcc_movcTemp;
					    }
					    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
					    SV_Target0.xyz = vec3(vec3(_Value, _Value, _Value)) * u_xlat1.xyz + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}