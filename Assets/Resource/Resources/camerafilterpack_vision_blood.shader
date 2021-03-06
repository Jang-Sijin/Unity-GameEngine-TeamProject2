Shader "CameraFilterPack/Vision_Blood" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 51799
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
					//
					//
					// Registers:
					//
					//   Name         Reg   Size
					//   ------------ ----- ----
					//   _TimeX       c0       1
					//   _Value       c1       1
					//   _Value2      c2       1
					//   _MainTex     s0       1
					//
					
					    ps_3_0
					    def c3, 0.100000001, 0.5, 0.0795774683, 0.400000006
					    def c4, 1, 0, -0.5, 0.00999999978
					    def c5, 6.28318548, -3.14159274, 0, 0
					    def c6, -0.899999976, -1.80336881, 0.333333343, 0.0333333351
					    def c7, -0.0500000007, -2, 3, 0
					    def c8, 3.1730001, -0.0410000011, -0.00033333333, 0.970000029
					    def c9, 0.277258873, -0.5, 0, 0
					    defi i0, 12, 0, 0, 0
					    defi i1, 10, 0, 0, 0
					    dcl_texcoord v0.xy
					    dcl_2d s0
					    mad r0.xyz, v0.xyxw, c4.xxyw, c4.yyxw
					    add r0.xyz, r0, c4.z
					    texld r1, c3, s0
					    mad r1.xyz, r1, c4.w, r0
					    mov r2.yz, c3
					    mad r0.w, c0.x, r2.z, r2.y
					    frc r0.w, r0.w
					    mad r0.w, r0.w, c5.x, c5.y
					    sincos r2.y, r0.w
					    mul r1.xyz, r1, c3.w
					    mov r2.xzw, r0.xyyz
					    mov r3.xyz, c4.y
					    mov r4.x, c4.y
					    rep i0
					      mad r5.xyz, r2.y, -c4.z, r2.xzww
					      mov r6.xyz, r5
					      mov r7.z, r4.x
					      rep i1
					        add r8.xyz, r6.zyxw, -c3.w
					        add r6.xyz, r8_abs, c6.x
					        dp3 r0.w, r2.xzww, r6
					        mul r0.w, r0_abs.w, c6.y
					        exp r0.w, r0.w
					        add r7.z, r0.w, r7.z
					      endrep
					      mul r4.xy, r7.z, c6.zwzw
					      mad r2.xzw, r1.xyyz, r4.x, r2
					      mul r4.zw, r4.x, r4.xyxy
					      mul r7.xy, r4.zyzw, r4.wzzw
					      mul r4.yzw, r7.xxyz, c8.xxyz
					      mad r3.xyz, r3, c8.w, r4.yzww
					    endrep
					    mov r0.x, c1.x
					    add r0.x, r0.x, c7.x
					    add r0.x, r0.x, -c2.x
					    add r0.yz, -c4.z, -v0.xxyw
					    dp2add r0.y, r0.yzzw, r0.yzzw, c4.y
					    rsq r0.y, r0.y
					    rcp r0.y, r0.y
					    add r0.xy, r0, -c1.x
					    rcp r0.x, r0.x
					    mul_sat r0.x, r0.x, r0.y
					    mad r0.y, r0.x, c7.y, c7.z
					    mul r0.x, r0.x, r0.x
					    mad r0.x, r0.y, -r0.x, c4.x
					    add r0.yzw, r3.xxyz, c4.x
					    log r1.x, r0.y
					    log r1.y, r0.z
					    log r1.z, r0.w
					    mad r0.yzw, r1.xxyz, c9.x, c9.y
					    mul r1.x, r0.y, -c4.z
					    mul r1.xy, r1.x, v0
					    texld r1, r1, s0
					    add r0.yzw, r0, r1.xxyz
					    texld r1, v0, s0
					    add r0.yzw, r0, -r1.xxyz
					    mad oC0.xyz, r0.x, r0.yzww, r1
					    mov oC0.w, c4.x
					
					// approximately 72 instruction slots used (3 texture, 69 arithmetic)"
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
						vec4 unused_0_4[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					vec3 u_xlat8;
					vec3 u_xlat9;
					vec3 u_xlat13;
					float u_xlat27;
					int u_xlati28;
					int u_xlati29;
					bool u_xlatb29;
					float u_xlat30;
					bool u_xlatb30;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy;
					    u_xlat0.z = 1.0;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(1.0, 1.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.5, -0.5, -0.5);
					    u_xlat1 = texture(_MainTex, vec2(0.100000001, 0.5));
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + u_xlat0.xyz;
					    u_xlat27 = _TimeX * 0.5;
					    u_xlat27 = sin(u_xlat27);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
					    u_xlat2.xyz = u_xlat0.xyz;
					    u_xlat3.x = float(0.0);
					    u_xlat3.y = float(0.0);
					    u_xlat3.z = float(0.0);
					    u_xlat4.x = 0.0;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat5.xyz = vec3(u_xlat27) * vec3(0.5, 0.5, 0.5) + u_xlat2.xyz;
					        u_xlat6.xyz = u_xlat5.xyz;
					        u_xlat7.z = u_xlat4.x;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<10 ; u_xlati_loop_2++)
					        {
					            u_xlat8.xyz = u_xlat6.zyx + vec3(-0.400000006, -0.400000006, -0.400000006);
					            u_xlat6.xyz = abs(u_xlat8.xyz) + vec3(-0.899999976, -0.899999976, -0.899999976);
					            u_xlat30 = dot(u_xlat2.xyz, u_xlat6.xyz);
					            u_xlat30 = abs(u_xlat30) * -1.80336881;
					            u_xlat30 = exp2(u_xlat30);
					            u_xlat7.z = u_xlat30 + u_xlat7.z;
					        }
					        u_xlat4.xy = u_xlat7.zz * vec2(0.333333343, 0.0333333351);
					        u_xlat2.xyz = u_xlat1.xyz * u_xlat4.xxx + u_xlat2.xyz;
					        u_xlat4.zw = u_xlat4.xx * u_xlat4.xy;
					        u_xlat7.xy = u_xlat4.zy * u_xlat4.wz;
					        u_xlat13.xyz = u_xlat7.xyz * vec3(3.1730001, -0.0410000011, -0.00033333333);
					        u_xlat3.xyz = u_xlat3.xyz * vec3(0.970000029, 0.970000029, 0.970000029) + u_xlat13.xyz;
					    }
					    u_xlat0.x = _Value + -0.0500000007;
					    u_xlat0.x = u_xlat0.x + (-_Value2);
					    u_xlat9.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
					    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
					    u_xlat0.y = sqrt(u_xlat9.x);
					    u_xlat0.xy = u_xlat0.xy + (-vec2(vec2(_Value, _Value)));
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = (-u_xlat9.x) * u_xlat0.x + 1.0;
					    u_xlat9.xyz = u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat9.xyz = log2(u_xlat9.xyz);
					    u_xlat9.xyz = u_xlat9.xyz * vec3(0.277258873, 0.277258873, 0.277258873) + vec3(-0.5, -0.5, -0.5);
					    u_xlat1.x = u_xlat9.x * 0.5;
					    u_xlat1.xy = u_xlat1.xx * vs_TEXCOORD0.xy;
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat9.xyz = u_xlat9.xyz + u_xlat1.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat9.xyz = u_xlat9.xyz + (-u_xlat1.xyz);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat9.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}