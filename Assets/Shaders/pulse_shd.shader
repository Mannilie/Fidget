// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|emission-1396-RGB,alpha-9016-OUT;n:type:ShaderForge.SFN_Tex2d,id:6818,x:32389,y:32655,ptovrint:False,ptlb:alpha,ptin:_alpha,varname:node_6818,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0bb84dc0968faa8489d7109dc5d1f3a6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:1396,x:32172,y:32807,ptovrint:False,ptlb:colour,ptin:_colour,varname:node_1396,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.6431373,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9016,x:32521,y:32876,varname:node_9016,prsc:2|A-6818-A,B-890-OUT;n:type:ShaderForge.SFN_Sin,id:4726,x:31954,y:32924,varname:node_4726,prsc:2|IN-421-TDB;n:type:ShaderForge.SFN_Time,id:421,x:31754,y:32908,varname:node_421,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:890,x:32237,y:32972,varname:node_890,prsc:2,frmn:-1,frmx:1,tomn:0.35,tomx:0.45|IN-4726-OUT;proporder:6818-1396;pass:END;sub:END;*/

Shader "Shader Forge/pulse_shd" {
    Properties {
        _alpha ("alpha", 2D) = "white" {}
        _colour ("colour", Color) = (1,0.6431373,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _alpha; uniform float4 _alpha_ST;
            uniform float4 _colour;
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
////// Lighting:
////// Emissive:
                float3 emissive = _colour.rgb;
                float3 finalColor = emissive;
                float4 _alpha_var = tex2D(_alpha,TRANSFORM_TEX(i.uv0, _alpha));
                float4 node_421 = _Time + _TimeEditor;
                fixed4 finalRGBA = fixed4(finalColor,(_alpha_var.a*(sin(node_421.b)*0.05+0.4)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
