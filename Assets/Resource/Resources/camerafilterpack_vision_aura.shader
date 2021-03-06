Shader "CameraFilterPack/Vision_Aura" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Value2 ("_ColorRGB", Vector) = (1,1,1,1)
		_Value5 ("Speed", Range(0, 1)) = 1
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			GpuProgramID 45967
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
					//   float4 _Value2;
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
					    def c6, 0.0208350997, -0.0851330012, 0.180141002, -0.330299497
					    def c7, 0.999866009, 0, 1, 3.14159274
					    def c8, -2, 1.57079637, 40, -3
					    def c9, 0.159154937, 0.5, 0.680000007, -0.00138883968
					    def c10, 0, 3, -2.52398507e-007, 2.47609005e-005
					    def c11, 0.0416666418, 0.200000003, 10, 0.300000012
					    def c12, 0.400000006, 0.699999988, 0, 0
					    def c13, 0.95492965, 0.5, 6.28318548, -3.14159274
					    def c14, 2.26541138, 2.58372116, 0.5, 0
					    defi i0, 3, 0, 0, 0
					    dcl_texcoord_pp v0.xy
					    dcl_2d s0
					    mov r0.x, -c3.x
					    mov r0.y, -c4.x
					    add r0.xy, r0, v0
					    mov r1.x, c0.x
					    mul r0.z, r1.x, c5.x
					    add r1.xy, -r0_abs, r0_abs.yxzw
					    cmp r1.xz, r1.x, r0_abs.xyyw, r0_abs.yyxw
					    rcp r0.w, r1.z
					    mul r0.w, r0.w, r1.x
					    mul r1.x, r0.w, r0.w
					    mad r1.z, r1.x, c6.x, c6.y
					    mad r1.z, r1.x, r1.z, c6.z
					    mad r1.z, r1.x, r1.z, c6.w
					    mad r1.x, r1.x, r1.z, c7.x
					    mul r0.w, r0.w, r1.x
					    cmp r1.x, r1.y, c7.y, c7.z
					    mad r1.y, r0.w, c8.x, c8.y
					    mad r0.w, r1.y, r1.x, r0.w
					    cmp r1.x, r0.x, -c7.y, -c7.w
					    add r0.w, r0.w, r1.x
					    add r1.x, -r0.x, r0.y
					    cmp r1.xy, r1.x, r0, r0.yxzw
					    cmp r1.y, r1.y, c7.z, c7.y
					    cmp r1.x, r1.x, c7.y, r1.y
					    add r1.y, r0.w, r0.w
					    mad r0.w, r1.x, -r1.y, r0.w
					    dp2add r1.x, r0, r0, c7.y
					    rsq r1.x, r1.x
					    rcp r1.x, r1.x
					    mul r1.y, r1.x, c1.x
					    mad r1.y, r1.y, c8.z, c8.w
					    mad r1.z, r0.w, c13.x, c13.y
					    frc r1.z, r1.z
					    mad r1.z, r1.z, c13.z, c13.w
					    sincos r2.x, r1.z
					    add r1.z, r0.w, r2.x
					    mad r1.z, r0.z, -c8.x, r1.z
					    mad r1.z, r1.z, c9.x, c9.y
					    frc r1.z, r1.z
					    mad r1.z, r1.z, c13.z, c13.w
					    sincos r2.x, r1.z
					    mad_sat r1.y, r2.x, c9.z, r1.y
					    mad r0.w, r1.x, -c1.x, r0.w
					    mov r1.xz, c10.xyyw
					    rep i0
					      mad r1.w, r0.w, r1.z, r0.z
					      add r2.xy, r0, r1.w
					      add r2.xy, r1.z, r2
					      mad r2.xy, r2, c9.x, c9.y
					      frc r2.xy, r2
					      mad r2.xy, r2, c13.z, c13.w
					      mul r2.xy, r2, r2
					      mad r2.zw, r2.xyxy, c10.z, c10.w
					      mad r2.zw, r2.xyxy, r2, c9.w
					      mad r2.zw, r2.xyxy, r2, c11.x
					      mad r2.zw, r2.xyxy, r2, -c13.y
					      mad r2.xy, r2, r2.zwzw, c7.z
					      mad r2.xy, r2, c11.y, r0
					      mul r2.zw, r2_abs.xyxy, c11.z
					      frc r3.xy, r2.zwzw
					      add r3.zw, r3.xyxy, -c13.y
					      add r2.zw, r2, -r3.xyxy
					      mov r1.w, c7.z
					      mov r3.x, -c7.z
					      rep i0
					        mov r4.x, r1.w
					        mov r3.y, -c7.z
					        rep i0
					          add r4.yz, r2.xzww, r3.xxyw
					          add r4.yz, r4, c0.x
					          mad r4.yz, r4, c9.x, c9.y
					          frc r4.yz, r4
					          mad r4.yz, r4, c13.z, c13.w
					          sincos r5.x, r4.y
					          sincos r6.x, r4.z
					          add r4.y, r5.x, r6.x
					          mad r4.yz, r4.y, c11.w, r3.xzww
					          add r4.yz, -r3.xxyw, r4
					          dp2add r4.y, r4.yzzw, r4.yzzw, c7.y
					          rsq r4.y, r4.y
					          rcp r4.y, r4.y
					          min r5.x, r4.y, r4.x
					          add r3.y, r3.y, c7.z
					          mov r4.x, r5.x
					        endrep
					        mov r1.w, r4.x
					        add r3.x, r3.x, c7.z
					      endrep
					      mad r2.xy, r2, c14, c14.z
					      frc r2.xy, r2
					      mad r2.xy, r2, c13.z, c13.w
					      sincos r3.x, r2.x
					      sincos r5.x, r2.y
					      add r2.x, r3.x, r5.x
					      mad r2.x, r2.x, c12.x, c12.y
					      mad r1.x, r1.w, r2.x, r1.x
					      add r1.z, r1.z, c7.z
					    endrep
					    texld r0, v0, s0
					    mul r1.xzw, r1.x, c2.xyyz
					    mul r1.xyz, r1.y, r1.xzww
					    mad oC0.xyz, r1, c2.w, r0
					    mov oC0.w, c7.z
					
					// approximately 156 instruction slots used (1 texture, 155 arithmetic)"
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
						vec4 _Value2;
						float _Value3;
						float _Value4;
						float _Value5;
						vec4 unused_0_7;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat10;
					float u_xlat11;
					int u_xlati11;
					bool u_xlatb11;
					vec2 u_xlat12;
					float u_xlat13;
					bool u_xlatb13;
					vec2 u_xlat14;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_Value3, _Value4));
					    u_xlat10 = _TimeX * _Value5;
					    u_xlat15 = min(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat1.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
					    u_xlat1.x = float(1.0) / u_xlat1.x;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.x = u_xlat15 * u_xlat15;
					    u_xlat6 = u_xlat1.x * 0.0208350997 + -0.0851330012;
					    u_xlat6 = u_xlat1.x * u_xlat6 + 0.180141002;
					    u_xlat6 = u_xlat1.x * u_xlat6 + -0.330299497;
					    u_xlat1.x = u_xlat1.x * u_xlat6 + 0.999866009;
					    u_xlat6 = u_xlat15 * u_xlat1.x;
					    u_xlatb11 = abs(u_xlat0.x)<abs(u_xlat0.y);
					    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
					    u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
					    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
					    u_xlatb1 = u_xlat0.x<(-u_xlat0.x);
					    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
					    u_xlat15 = u_xlat15 + u_xlat1.x;
					    u_xlat1.x = min(u_xlat0.x, u_xlat0.y);
					    u_xlat6 = max(u_xlat0.x, u_xlat0.y);
					    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
					    u_xlatb6 = u_xlat6>=(-u_xlat6);
					    u_xlatb1 = u_xlatb6 && u_xlatb1;
					    u_xlat15 = (u_xlatb1) ? (-u_xlat15) : u_xlat15;
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat6 = u_xlat1.x * _Value;
					    u_xlat6 = u_xlat6 * 40.0 + -3.0;
					    u_xlat11 = u_xlat15 * 6.0;
					    u_xlat11 = cos(u_xlat11);
					    u_xlat11 = u_xlat15 + u_xlat11;
					    u_xlat11 = u_xlat10 * 2.0 + u_xlat11;
					    u_xlat11 = cos(u_xlat11);
					    u_xlat6 = u_xlat11 * 0.680000007 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat15 = (-u_xlat1.x) * _Value + u_xlat15;
					    u_xlat1.x = float(0.0);
					    for(int u_xlati_loop_1 = int(3) ; u_xlati_loop_1<6 ; u_xlati_loop_1++)
					    {
					        u_xlat16 = float(u_xlati_loop_1);
					        u_xlat2.x = u_xlat15 * u_xlat16 + u_xlat10;
					        u_xlat2.xy = u_xlat0.xy + u_xlat2.xx;
					        u_xlat2.xy = vec2(u_xlat16) + u_xlat2.xy;
					        u_xlat2.xy = cos(u_xlat2.xy);
					        u_xlat2.xy = u_xlat2.xy * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
					        u_xlat12.xy = abs(u_xlat2.xy) * vec2(10.0, 10.0);
					        u_xlat3.xy = fract(u_xlat12.xy);
					        u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
					        u_xlat12.xy = floor(u_xlat12.xy);
					        u_xlat16 = 1.0;
					        u_xlat4.x = -1.0;
					        while(true){
					            u_xlatb13 = u_xlat4.x>=2.0;
					            if(u_xlatb13){break;}
					            u_xlat13 = u_xlat16;
					            u_xlat4.y = -1.0;
					            while(true){
					                u_xlatb18 = u_xlat4.y>=2.0;
					                if(u_xlatb18){break;}
					                u_xlat14.xy = u_xlat12.xy + u_xlat4.xy;
					                u_xlat14.xy = u_xlat14.xy + vec2(_TimeX);
					                u_xlat14.xy = cos(u_xlat14.xy);
					                u_xlat18 = u_xlat14.y + u_xlat14.x;
					                u_xlat14.xy = vec2(u_xlat18) * vec2(0.300000012, 0.300000012) + u_xlat3.xy;
					                u_xlat14.xy = (-u_xlat4.xy) + u_xlat14.xy;
					                u_xlat18 = dot(u_xlat14.xy, u_xlat14.xy);
					                u_xlat18 = sqrt(u_xlat18);
					                u_xlat13 = min(u_xlat18, u_xlat13);
					                u_xlat4.y = u_xlat4.y + 1.0;
					            }
					            u_xlat16 = u_xlat13;
					            u_xlat4.x = u_xlat4.x + 1.0;
					        }
					        u_xlat2.xy = u_xlat2.xy * vec2(14.2340002, 16.2339993);
					        u_xlat2.xy = cos(u_xlat2.xy);
					        u_xlat2.x = u_xlat2.y + u_xlat2.x;
					        u_xlat2.x = u_xlat2.x * 0.400000006 + 0.699999988;
					        u_xlat1.x = u_xlat16 * u_xlat2.x + u_xlat1.x;
					    }
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xzw = u_xlat1.xxx * _Value2.xyz;
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xzw;
					    SV_Target0.xyz = u_xlat1.xyz * _Value2.www + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}