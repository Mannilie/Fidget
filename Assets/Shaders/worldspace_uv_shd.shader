// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|emission-4723-OUT,clip-4389-R;n:type:ShaderForge.SFN_ComponentMask,id:1658,x:32175,y:32655,varname:node_1658,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1715-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:1715,x:31995,y:32628,varname:node_1715,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8657,x:32391,y:32583,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_8657,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1884-OUT;n:type:ShaderForge.SFN_Multiply,id:1884,x:32272,y:32818,varname:node_1884,prsc:2|A-1658-OUT,B-7219-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7219,x:32091,y:32952,ptovrint:False,ptlb:size,ptin:_size,varname:node_7219,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.1;n:type:ShaderForge.SFN_Multiply,id:4723,x:32515,y:32923,varname:node_4723,prsc:2|A-8657-RGB,B-9816-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7564,x:32172,y:33011,ptovrint:False,ptlb:emissive power,ptin:_emissivepower,varname:node_7564,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:7318,x:32172,y:33154,ptovrint:False,ptlb:node_7318,ptin:_node_7318,varname:node_7318,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9816,x:32391,y:33170,varname:node_9816,prsc:2|A-7564-OUT,B-7318-RGB;n:type:ShaderForge.SFN_Tex2d,id:4389,x:32532,y:33271,ptovrint:False,ptlb:node_4389,ptin:_node_4389,varname:node_4389,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eb32f1381eae924448d72197e298c457,ntxv:0,isnm:False;proporder:8657-7219-7564-7318-4389;pass:END;sub:END;*/

Shader "Shader Forge/worldspace_uv_shd" {
    Properties {
        _diffuse ("diffuse", 2D) = "white" {}
        _size ("size", Float ) = 0.1
        _emissivepower ("emissive power", Float ) = 1
        _node_7318 ("node_7318", Color) = (0.5,0.5,0.5,1)
        _node_4389 ("node_4389", 2D) = "white" {}
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
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _size;
            uniform float _emissivepower;
            uniform float4 _node_7318;
            uniform sampler2D _node_4389; uniform float4 _node_4389_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
                float4 _node_4389_var = tex2D(_node_4389,TRANSFORM_TEX(i.uv0, _node_4389));
                clip(_node_4389_var.r - 0.5);
////// Lighting:
////// Emissive:
                float2 node_1884 = (i.posWorld.rgb.rg*_size);
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(node_1884, _diffuse));
                float3 emissive = (_diffuse_var.rgb*(_emissivepower*_node_7318.rgb));
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
            uniform sampler2D _node_4389; uniform float4 _node_4389_ST;
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
                float4 _node_4389_var = tex2D(_node_4389,TRANSFORM_TEX(i.uv0, _node_4389));
                clip(_node_4389_var.r - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
