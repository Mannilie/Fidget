// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:32730,y:32679,varname:node_4013,prsc:2|spec-8330-OUT,gloss-7828-OUT,emission-1791-OUT,clip-8473-A,voffset-5459-OUT;n:type:ShaderForge.SFN_Tex2d,id:8473,x:31997,y:32683,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_2794,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:2513,x:31956,y:32891,ptovrint:False,ptlb:tint colour,ptin:_tintcolour,varname:node_2398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:3673,x:32006,y:33100,ptovrint:False,ptlb:emissive strength,ptin:_emissivestrength,varname:node_2074,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1791,x:32233,y:32917,varname:node_1791,prsc:2|A-4574-OUT,B-3673-OUT;n:type:ShaderForge.SFN_Multiply,id:4574,x:32203,y:32683,varname:node_4574,prsc:2|A-8473-RGB,B-2513-RGB;n:type:ShaderForge.SFN_ValueProperty,id:8330,x:32392,y:32780,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_8271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:7828,x:32392,y:32862,ptovrint:False,ptlb:gloss,ptin:_gloss,varname:_specular_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Panner,id:9825,x:31988,y:33272,varname:node_9825,prsc:2,spu:0.1,spv:0.1;n:type:ShaderForge.SFN_Multiply,id:8962,x:32233,y:33336,varname:node_8962,prsc:2|A-9825-UVOUT,B-6458-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6458,x:31917,y:33492,ptovrint:False,ptlb:noise amount,ptin:_noiseamount,varname:node_6458,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_ComponentMask,id:2364,x:32643,y:33412,varname:node_2364,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6054-RGB;n:type:ShaderForge.SFN_Multiply,id:7141,x:32845,y:33484,varname:node_7141,prsc:2|A-2364-OUT,B-761-OUT;n:type:ShaderForge.SFN_NormalVector,id:761,x:32629,y:33626,prsc:2,pt:False;n:type:ShaderForge.SFN_Add,id:5459,x:33349,y:33424,varname:node_5459,prsc:2|A-6047-OUT,B-7915-OUT;n:type:ShaderForge.SFN_Multiply,id:6333,x:32724,y:33886,varname:node_6333,prsc:2|A-3635-OUT,B-8967-RGB;n:type:ShaderForge.SFN_Multiply,id:3635,x:32417,y:33799,varname:node_3635,prsc:2|A-1648-OUT,B-1910-OUT;n:type:ShaderForge.SFN_Color,id:8967,x:32496,y:33913,ptovrint:False,ptlb:direction,ptin:_direction,varname:node_8967,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:1910,x:32110,y:33966,ptovrint:False,ptlb:movement amount,ptin:_movementamount,varname:node_1910,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_Sin,id:1648,x:32194,y:33770,varname:node_1648,prsc:2|IN-7039-T;n:type:ShaderForge.SFN_Time,id:7039,x:31950,y:33757,varname:node_7039,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7915,x:33228,y:33623,varname:node_7915,prsc:2|A-2633-B,B-6333-OUT;n:type:ShaderForge.SFN_VertexColor,id:2633,x:32795,y:33712,varname:node_2633,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:6054,x:32425,y:33379,ptovrint:False,ptlb:noise texture,ptin:_noisetexture,varname:node_6054,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8962-OUT;n:type:ShaderForge.SFN_Multiply,id:6047,x:33163,y:33405,varname:node_6047,prsc:2|A-7141-OUT,B-2633-R;proporder:8330-7828-8473-2513-3673-6458-8967-1910-6054;pass:END;sub:END;*/

Shader "Shader Forge/vertexOffset_shd" {
    Properties {
        _specular ("specular", Float ) = 0
        _gloss ("gloss", Float ) = 0
        _diffuse ("diffuse", 2D) = "white" {}
        _tintcolour ("tint colour", Color) = (1,1,1,1)
        _emissivestrength ("emissive strength", Float ) = 1
        _noiseamount ("noise amount", Float ) = 0.3
        _direction ("direction", Color) = (0,1,0,1)
        _movementamount ("movement amount", Float ) = 0.3
        _noisetexture ("noise texture", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float4 _tintcolour;
            uniform float _emissivestrength;
            uniform float _specular;
            uniform float _gloss;
            uniform float _noiseamount;
            uniform float4 _direction;
            uniform float _movementamount;
            uniform sampler2D _noisetexture; uniform float4 _noisetexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_3155 = _Time + _TimeEditor;
                float2 node_8962 = ((o.uv0+node_3155.g*float2(0.1,0.1))*_noiseamount);
                float4 _noisetexture_var = tex2Dlod(_noisetexture,float4(TRANSFORM_TEX(node_8962, _noisetexture),0.0,0));
                float4 node_7039 = _Time + _TimeEditor;
                v.vertex.xyz += (((_noisetexture_var.rgb.r*v.normal)*o.vertexColor.r)+(o.vertexColor.b*((sin(node_7039.g)*_movementamount)*_direction.rgb)));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(i.uv0, _diffuse));
                clip(_diffuse_var.a - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_specular,_specular,_specular);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
////// Emissive:
                float3 emissive = ((_diffuse_var.rgb*_tintcolour.rgb)*_emissivestrength);
/// Final Color:
                float3 finalColor = specular + emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float4 _tintcolour;
            uniform float _emissivestrength;
            uniform float _specular;
            uniform float _gloss;
            uniform float _noiseamount;
            uniform float4 _direction;
            uniform float _movementamount;
            uniform sampler2D _noisetexture; uniform float4 _noisetexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_3882 = _Time + _TimeEditor;
                float2 node_8962 = ((o.uv0+node_3882.g*float2(0.1,0.1))*_noiseamount);
                float4 _noisetexture_var = tex2Dlod(_noisetexture,float4(TRANSFORM_TEX(node_8962, _noisetexture),0.0,0));
                float4 node_7039 = _Time + _TimeEditor;
                v.vertex.xyz += (((_noisetexture_var.rgb.r*v.normal)*o.vertexColor.r)+(o.vertexColor.b*((sin(node_7039.g)*_movementamount)*_direction.rgb)));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(i.uv0, _diffuse));
                clip(_diffuse_var.a - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_specular,_specular,_specular);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/// Final Color:
                float3 finalColor = specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _noiseamount;
            uniform float4 _direction;
            uniform float _movementamount;
            uniform sampler2D _noisetexture; uniform float4 _noisetexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_4736 = _Time + _TimeEditor;
                float2 node_8962 = ((o.uv0+node_4736.g*float2(0.1,0.1))*_noiseamount);
                float4 _noisetexture_var = tex2Dlod(_noisetexture,float4(TRANSFORM_TEX(node_8962, _noisetexture),0.0,0));
                float4 node_7039 = _Time + _TimeEditor;
                v.vertex.xyz += (((_noisetexture_var.rgb.r*v.normal)*o.vertexColor.r)+(o.vertexColor.b*((sin(node_7039.g)*_movementamount)*_direction.rgb)));
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 normalDirection = i.normalDir;
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(i.uv0, _diffuse));
                clip(_diffuse_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
