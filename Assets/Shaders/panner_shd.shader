// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|emission-6511-OUT,clip-2334-A;n:type:ShaderForge.SFN_Multiply,id:946,x:32223,y:32609,varname:node_946,prsc:2|A-2334-RGB,B-9486-RGB;n:type:ShaderForge.SFN_Tex2d,id:2334,x:32052,y:32631,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_2794,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b47e77cffcd85c44cabd87696fa6d81b,ntxv:0,isnm:False|UVIN-3801-UVOUT;n:type:ShaderForge.SFN_Color,id:9486,x:32011,y:32839,ptovrint:False,ptlb:tint colour,ptin:_tintcolour,varname:node_2398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6116,x:32288,y:32865,varname:node_6116,prsc:2|A-946-OUT,B-5708-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5708,x:32061,y:33048,ptovrint:False,ptlb:emissive strength,ptin:_emissivestrength,varname:node_2074,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Panner,id:3801,x:31869,y:32631,varname:node_3801,prsc:2,spu:-0.025,spv:0|DIST-4394-OUT;n:type:ShaderForge.SFN_Time,id:54,x:31685,y:32616,varname:node_54,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4394,x:31798,y:32797,varname:node_4394,prsc:2|A-54-TSL,B-6005-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6005,x:31749,y:32958,ptovrint:False,ptlb:speed,ptin:_speed,varname:node_6005,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1.5;n:type:ShaderForge.SFN_Tex2d,id:1865,x:32129,y:33185,ptovrint:False,ptlb:node_1865,ptin:_node_1865,varname:node_1865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:268d2bfde410e5742b5342b51423d875,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3428,x:32350,y:33079,varname:node_3428,prsc:2|A-2334-A,B-1865-RGB;n:type:ShaderForge.SFN_Blend,id:6511,x:32500,y:32712,varname:node_6511,prsc:2,blmd:12,clmp:True|SRC-946-OUT,DST-3428-OUT;proporder:2334-9486-5708-6005-1865;pass:END;sub:END;*/

Shader "Shader Forge/panner_shd" {
    Properties {
        _diffuse ("diffuse", 2D) = "white" {}
        _tintcolour ("tint colour", Color) = (1,1,1,1)
        _emissivestrength ("emissive strength", Float ) = 1
        _speed ("speed", Float ) = 1.5
        _node_1865 ("node_1865", 2D) = "white" {}
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
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float4 _tintcolour;
            uniform float _speed;
            uniform sampler2D _node_1865; uniform float4 _node_1865_ST;
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
                float4 node_54 = _Time + _TimeEditor;
                float2 node_3801 = (i.uv0+(node_54.r*_speed)*float2(-0.025,0));
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(node_3801, _diffuse));
                clip(_diffuse_var.a - 0.5);
////// Lighting:
////// Emissive:
                float3 node_946 = (_diffuse_var.rgb*_tintcolour.rgb);
                float4 _node_1865_var = tex2D(_node_1865,TRANSFORM_TEX(i.uv0, _node_1865));
                float3 emissive = saturate((node_946 > 0.5 ?  (1.0-(1.0-2.0*(node_946-0.5))*(1.0-(_diffuse_var.a*_node_1865_var.rgb))) : (2.0*node_946*(_diffuse_var.a*_node_1865_var.rgb))) );
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
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _speed;
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
                float4 node_54 = _Time + _TimeEditor;
                float2 node_3801 = (i.uv0+(node_54.r*_speed)*float2(-0.025,0));
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(node_3801, _diffuse));
                clip(_diffuse_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
