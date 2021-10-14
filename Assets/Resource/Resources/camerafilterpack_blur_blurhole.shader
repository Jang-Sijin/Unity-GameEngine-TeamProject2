Shader "CameraFilterPack/BlurHole" {
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
			GpuProgramID 54151
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
					//   float _Alpha;
					//   float _Alpha2;
					//   float _CenterX;
					//   float _CenterY;
					//   float _Distortion;
					//   sampler2D _MainTex;
					//   float _Radius;
					//   float4 _ScreenResolution;
					//   float _SpotSize;
					//
					//
					// Registers:
					//
					//   Name              Reg   Size
					//   ----------------- ----- ----
					//   _Distortion       c0       1
					//   _Radius           c1       1
					//   _SpotSize         c2       1
					//   _CenterX          c3       1
					//   _CenterY          c4       1
					//   _Alpha            c5       1
					//   _Alpha2           c6       1
					//   _ScreenResolution c7       1
					//   _MainTex          s0       1
					//
					
					    ps_3_0
					    def c8, 0.150000006, -2, 3, 0.25
					    def c9, -2, -1, 0.160000011, 2
					    def c10, -2, 0, 1, -1
					    def c11, -1, 2, 0, -2
					    def c12, 0, 2, 1, -2
					    dcl_texcoord_pp v0.xy
					    dcl_2d s0
					    mul r0.xy, c7, v0
					    mov r1.xyw, c9
					    mad r2, c0.x, r1.xxxy, r0.xyxy
					    rcp r3.x, c7.x
					    rcp r3.y, c7.y
					    mul r2, r2, r3.xyxy
					    texld_pp r4, r2.zwzw, s0
					    texld_pp r2, r2, s0
					    mul r4.xyz, r4, c9.z
					    mad r2.xyz, r2, c9.z, r4
					    mov r4.x, c0.x
					    mad r5, r4.x, c10.xyxz, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r5, c0.x, r1.xwyx, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r0.zw, v0.xyxy, c7.xyxy, -r4.x
					    mul r0.zw, r3.xyxy, r0
					    texld_pp r5, r0.zwzw, s0
					    mad r2.xyz, r5, c9.z, r2
					    mad r5, r4.x, c10.wywz, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r5, r4.x, c11, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r5, r4.x, c10.ywyz, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mul r0.zw, r0.xyxy, r3.xyxy
					    texld_pp r6, r0.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r5, r4.x, c12, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r5, r4.x, c10.zwzy, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r0.zw, v0.xyxy, c7.xyxy, r4.x
					    mul r0.zw, r3.xyxy, r0
					    texld_pp r5, r0.zwzw, s0
					    mad r2.xyz, r5, c9.z, r2
					    mad r5, c0.x, -r1.yxxw, r0.xyxy
					    mul r5, r3.xyxy, r5
					    texld_pp r6, r5, s0
					    texld_pp r5, r5.zwzw, s0
					    mad r2.xyz, r6, c9.z, r2
					    mad r2.xyz, r5, c9.z, r2
					    mad r4, r4.x, c11.yxyz, r0.xyxy
					    mul r4, r3.xyxy, r4
					    texld_pp r5, r4, s0
					    texld_pp r4, r4.zwzw, s0
					    mad r2.xyz, r5, c9.z, r2
					    mad r2.xyz, r4, c9.z, r2
					    mad r0.zw, c0.x, -r1.xyxy, r0.xyxy
					    mad r0.xy, c0.x, r1.w, r0
					    mul r0, r3.xyxy, r0
					    texld_pp r1, r0.zwzw, s0
					    mad r1.xyz, r1, c9.z, r2
					    texld_pp r0, r0, s0
					    mad r0.xyz, r0, c9.z, r1
					    texld r1, v0, s0
					    mad r2.xyz, r0, c8.w, -r1
					    mad r1.xyz, c6.x, r2, r1
					    mad r0.xyz, r0, c8.w, -r1
					    add r2.x, c3.x, -v0.x
					    add r2.y, c4.x, -v0.y
					    dp2add r0.w, r2, r2, c10.y
					    rsq r0.w, r0.w
					    rcp r0.w, r0.w
					    add r0.w, r0.w, -c1.x
					    mov r2.x, c8.x
					    mul r1.w, r2.x, c2.x
					    rcp r1.w, r1.w
					    mul_sat r0.w, r0.w, r1.w
					    mad r1.w, r0.w, c8.y, c8.z
					    mul r0.w, r0.w, r0.w
					    mad r0.w, r1.w, -r0.w, -c9.y
					    add r0.w, -r0.w, -c9.y
					    mul r0.w, r0.w, c5.x
					    mad oC0.xyz, r0.w, r0, r1
					    mov oC0.w, -c9.y
					
					// approximately 105 instruction slots used (26 texture, 79 arithmetic)"
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
						float _Distortion;
						float _Radius;
						float _SpotSize;
						float _CenterX;
						float _CenterY;
						float _Alpha;
						float _Alpha2;
						vec4 _ScreenResolution;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					ivec2 u_xlati1;
					bool u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec2 u_xlat7;
					float u_xlat11;
					int u_xlati11;
					float u_xlat12;
					ivec2 u_xlati12;
					float u_xlat15;
					int u_xlati15;
					float u_xlat16;
					bool u_xlatb16;
					vec4 TempArray0[6];
					void main()
					{
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    u_xlat0.z = float(0.0);
					    u_xlati15 = int(int(0xFFFFFFFEu));
					    while(true){
					        u_xlatb1 = 2<u_xlati15;
					        if(u_xlatb1){break;}
					        u_xlati1.xy = ivec2(u_xlati15) + ivec2(2, 1);
					        u_xlat1.x = TempArray0[u_xlati1.x].x;
					        u_xlat11 = float(u_xlati15);
					        u_xlat2.x = u_xlat11 * _Distortion;
					        u_xlat3.xyz = u_xlat0.xyz;
					        u_xlati11 = int(0xFFFFFFFEu);
					        while(true){
					            u_xlatb16 = 2<u_xlati11;
					            if(u_xlatb16){break;}
					            u_xlati12.xy = ivec2(u_xlati11) + ivec2(2, 1);
					            u_xlat16 = TempArray0[u_xlati12.x].x;
					            u_xlat16 = u_xlat1.x * u_xlat16;
					            u_xlat12 = float(u_xlati11);
					            u_xlat2.y = u_xlat12 * _Distortion;
					            u_xlat7.xy = vs_TEXCOORD0.xy * _ScreenResolution.xy + u_xlat2.xy;
					            u_xlat7.xy = u_xlat7.xy / _ScreenResolution.xy;
					            u_xlat4 = texture(_MainTex, u_xlat7.xy);
					            u_xlat3.xyz = vec3(u_xlat16) * u_xlat4.xyz + u_xlat3.xyz;
					            u_xlati11 = u_xlati12.y;
					        }
					        u_xlat0.xyz = u_xlat3.xyz;
					        u_xlati15 = u_xlati1.y;
					    }
					    u_xlat15 = _SpotSize * 0.150000006;
					    u_xlat1.xy = (-vs_TEXCOORD0.xy) + vec2(_CenterX, _CenterY);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x + (-_Radius);
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat1.x = u_xlat15 * -2.0 + 3.0;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat15 = (-u_xlat1.x) * u_xlat15 + 1.0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat1.xyz);
					    u_xlat1.xyz = vec3(vec3(_Alpha2, _Alpha2, _Alpha2)) * u_xlat2.xyz + u_xlat1.xyz;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _Alpha;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + (-u_xlat1.xyz);
					    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}