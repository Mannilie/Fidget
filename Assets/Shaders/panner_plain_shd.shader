// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|emission-8288-OUT,clip-5517-A;n:type:ShaderForge.SFN_Time,id:4170,x:31668,y:32613,varname:node_4170,prsc:2;n:type:ShaderForge.SFN_Panner,id:3090,x:31852,y:32628,varname:node_3090,prsc:2,spu:-0.025,spv:0|DIST-3915-OUT;n:type:ShaderForge.SFN_Multiply,id:3915,x:31781,y:32794,varname:node_3915,prsc:2|A-4170-TSL,B-6602-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6602,x:31732,y:32955,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_6005,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.5;n:type:ShaderForge.SFN_Color,id:9590,x:31994,y:32836,ptovrint:False,ptlb:tint colour,ptin:_tintcolour,varname:node_2398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5517,x:32035,y:32628,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_2794,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b47e77cffcd85c44cabd87696fa6d81b,ntxv:0,isnm:False|UVIN-3090-UVOUT;n:type:ShaderForge.SFN_Multiply,id:2450,x:32206,y:32606,varname:node_2450,prsc:2|A-5517-RGB,B-9590-RGB;n:type:ShaderForge.SFN_ValueProperty,id:7893,x:32044,y:33045,ptovrint:False,ptlb:emissive strength,ptin:_emissivestrength,varname:node_2074,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:8288,x:32271,y:32862,varname:node_8288,prsc:2|A-2450-OUT,B-7893-OUT;proporder:9590-5517-7893-6602;pass:END;sub:END;*/

Shader "Shader Forge/panner_plain_shd" {
    Properties {
        _tintcolour ("tint colour", Color) = (1,1,1,1)
        _diffuse ("diffuse", 2D) = "white" {}
        _emissivestrength ("emissive strength", Float ) = 1
        _speed ("speed", Float ) = 1.5
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _speed;
            uniform float4 _tintcolour;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _emissivestrength;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float4 node_4170 = _Time + _TimeEditor;
                float2 node_3090 = (i.uv0+(node_4170.r*_speed)*float2(-0.025,0));
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(node_3090, _diffuse));
                clip(_diffuse_var.a - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = ((_diffuse_var.rgb*_tintcolour.rgb)*_emissivestrength);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            uniform float _speed;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float4 node_4170 = _Time + _TimeEditor;
                float2 node_3090 = (i.uv0+(node_4170.r*_speed)*float2(-0.025,0));
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(node_3090, _diffuse));
                clip(_diffuse_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
