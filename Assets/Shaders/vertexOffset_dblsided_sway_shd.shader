// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|spec-7979-OUT,gloss-1404-OUT,emission-2601-OUT,clip-5937-A,voffset-5945-OUT;n:type:ShaderForge.SFN_Multiply,id:2601,x:32249,y:32863,varname:node_2601,prsc:2|A-3631-OUT,B-5337-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5337,x:32022,y:33046,ptovrint:False,ptlb:emissive strength,ptin:_emissivestrength,varname:node_2074,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:2188,x:31972,y:32837,ptovrint:False,ptlb:tint colour,ptin:_tintcolour,varname:node_2398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5937,x:32013,y:32629,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_2794,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3631,x:32219,y:32629,varname:node_3631,prsc:2|A-5937-RGB,B-2188-RGB;n:type:ShaderForge.SFN_ValueProperty,id:1404,x:32408,y:32808,ptovrint:False,ptlb:gloss,ptin:_gloss,varname:_specular_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:7979,x:32408,y:32726,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_8271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Panner,id:5358,x:31459,y:33163,varname:node_5358,prsc:2,spu:0.1,spv:0.1|DIST-1202-TSL;n:type:ShaderForge.SFN_ValueProperty,id:3554,x:31361,y:33510,ptovrint:False,ptlb:noise amount,ptin:_noiseamount,varname:_noiseamount_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.01;n:type:ShaderForge.SFN_Time,id:6340,x:31361,y:33637,varname:node_6340,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:2903,x:31521,y:33846,ptovrint:False,ptlb:movement amount,ptin:_movementamount,varname:_movementamount_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_Sin,id:2466,x:31605,y:33650,varname:node_2466,prsc:2|IN-6340-T;n:type:ShaderForge.SFN_Multiply,id:5483,x:31828,y:33679,varname:node_5483,prsc:2|A-2466-OUT,B-2903-OUT;n:type:ShaderForge.SFN_Color,id:5431,x:31907,y:33793,ptovrint:False,ptlb:direction,ptin:_direction,varname:_direction_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:41,x:32135,y:33766,varname:node_41,prsc:2|A-5483-OUT,B-5431-RGB;n:type:ShaderForge.SFN_VertexColor,id:360,x:32206,y:33592,varname:node_360,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:4069,x:32032,y:33507,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:6333,x:32256,y:33364,varname:node_6333,prsc:2|A-6904-OUT,B-4069-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6904,x:32054,y:33292,varname:node_6904,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6366-RGB;n:type:ShaderForge.SFN_Tex2d,id:6366,x:31812,y:33259,ptovrint:False,ptlb:noise texture,ptin:_noisetexture,varname:_noisetexture_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e958c6041cfe445e987c73751e8d4082,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4293,x:31625,y:33461,varname:node_4293,prsc:2|A-5358-UVOUT,B-3554-OUT;n:type:ShaderForge.SFN_Multiply,id:3009,x:32477,y:33364,varname:node_3009,prsc:2|A-6333-OUT,B-360-R;n:type:ShaderForge.SFN_Multiply,id:5945,x:32639,y:33503,varname:node_5945,prsc:2|A-360-B,B-41-OUT;n:type:ShaderForge.SFN_Add,id:6746,x:32754,y:33344,varname:node_6746,prsc:2|A-3009-OUT,B-5945-OUT;n:type:ShaderForge.SFN_Time,id:1202,x:31232,y:33240,varname:node_1202,prsc:2;n:type:ShaderForge.SFN_Sin,id:8071,x:31424,y:33330,varname:node_8071,prsc:2|IN-1202-T;n:type:ShaderForge.SFN_Color,id:8212,x:31898,y:33507,ptovrint:False,ptlb:node_8783,ptin:_node_8783,varname:node_8783,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;proporder:7979-1404-5337-2188-5937-2903-5431;pass:END;sub:END;*/

Shader "Shader Forge/vertexOffset_dblsided_sway_shd" {
    Properties {
        _specular ("specular", Float ) = 0
        _gloss ("gloss", Float ) = 0
        _emissivestrength ("emissive strength", Float ) = 1
        _tintcolour ("tint colour", Color) = (1,1,1,1)
        _diffuse ("diffuse", 2D) = "white" {}
        _movementamount ("movement amount", Float ) = 0.3
        _direction ("direction", Color) = (0,1,0,1)
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float _emissivestrength;
            uniform float4 _tintcolour;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _gloss;
            uniform float _specular;
            uniform float _movementamount;
            uniform float4 _direction;
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
                float4 node_6340 = _Time + _TimeEditor;
                float3 node_5945 = (o.vertexColor.b*((sin(node_6340.g)*_movementamount)*_direction.rgb));
                v.vertex.xyz += node_5945;
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float _emissivestrength;
            uniform float4 _tintcolour;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _gloss;
            uniform float _specular;
            uniform float _movementamount;
            uniform float4 _direction;
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
                float4 node_6340 = _Time + _TimeEditor;
                float3 node_5945 = (o.vertexColor.b*((sin(node_6340.g)*_movementamount)*_direction.rgb));
                v.vertex.xyz += node_5945;
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
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _movementamount;
            uniform float4 _direction;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 node_6340 = _Time + _TimeEditor;
                float3 node_5945 = (o.vertexColor.b*((sin(node_6340.g)*_movementamount)*_direction.rgb));
                v.vertex.xyz += node_5945;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
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
