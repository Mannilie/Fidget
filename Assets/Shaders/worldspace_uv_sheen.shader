// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:33462,y:32803,varname:node_4013,prsc:2|emission-9854-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8390,x:31779,y:32709,varname:node_8390,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2631-XYZ;n:type:ShaderForge.SFN_FragmentPosition,id:2631,x:31488,y:32706,varname:node_2631,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:7829,x:32529,y:32342,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_8657,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5806-OUT;n:type:ShaderForge.SFN_Multiply,id:5806,x:32097,y:32875,varname:node_5806,prsc:2|A-8390-OUT,B-5148-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5148,x:31569,y:32943,ptovrint:False,ptlb:size,ptin:_size,varname:node_7219,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.05;n:type:ShaderForge.SFN_Multiply,id:4574,x:32790,y:32661,varname:node_4574,prsc:2|A-7829-RGB,B-3106-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9168,x:32353,y:32831,ptovrint:False,ptlb:emissive power,ptin:_emissivepower,varname:node_7564,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:3484,x:32353,y:32929,ptovrint:False,ptlb:tint,ptin:_tint,varname:node_7318,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3106,x:32561,y:32867,varname:node_3106,prsc:2|A-9168-OUT,B-3484-RGB;n:type:ShaderForge.SFN_Panner,id:1532,x:32410,y:33162,varname:node_1532,prsc:2,spu:1,spv:3|UVIN-9357-OUT,DIST-9489-OUT;n:type:ShaderForge.SFN_Time,id:9292,x:31730,y:33168,varname:node_9292,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9489,x:31956,y:33216,varname:node_9489,prsc:2|A-9292-TDB,B-8541-OUT;n:type:ShaderForge.SFN_Add,id:9854,x:33222,y:32905,varname:node_9854,prsc:2|A-4574-OUT,B-9307-OUT;n:type:ShaderForge.SFN_Multiply,id:3883,x:33124,y:33308,varname:node_3883,prsc:2|A-9886-RGB,B-7472-OUT;n:type:ShaderForge.SFN_Time,id:3469,x:31831,y:33519,varname:node_3469,prsc:2;n:type:ShaderForge.SFN_Sin,id:3893,x:32363,y:33581,varname:node_3893,prsc:2|IN-2650-OUT;n:type:ShaderForge.SFN_RemapRange,id:9398,x:32592,y:33555,varname:node_9398,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-3893-OUT;n:type:ShaderForge.SFN_Multiply,id:2650,x:32116,y:33621,varname:node_2650,prsc:2|A-3469-T,B-9033-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9033,x:31917,y:33749,ptovrint:False,ptlb:offset_sin,ptin:_offset_sin,varname:node_9033,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:2923,x:31924,y:33143,ptovrint:False,ptlb:alphasize,ptin:_alphasize,varname:node_2923,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:100;n:type:ShaderForge.SFN_Multiply,id:7472,x:32868,y:33559,varname:node_7472,prsc:2|A-9398-OUT,B-6571-OUT;n:type:ShaderForge.SFN_Time,id:6828,x:31969,y:33873,varname:node_6828,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:2342,x:31969,y:34082,ptovrint:False,ptlb:offset_cos,ptin:_offset_cos,varname:_node_9033_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4323,x:32235,y:33947,varname:node_4323,prsc:2|A-6828-T,B-2342-OUT;n:type:ShaderForge.SFN_RemapRange,id:6571,x:32681,y:33869,varname:node_6571,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-4040-OUT;n:type:ShaderForge.SFN_Cos,id:4040,x:32455,y:33937,varname:node_4040,prsc:2|IN-4323-OUT;n:type:ShaderForge.SFN_Vector3,id:5530,x:32749,y:32979,varname:node_5530,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Tex2d,id:9886,x:32685,y:33197,ptovrint:False,ptlb:sheen_alpha,ptin:_sheen_alpha,varname:node_9886,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9cb4ce147db0f2647a7f97a443bad571,ntxv:0,isnm:False|UVIN-1532-UVOUT;n:type:ShaderForge.SFN_Multiply,id:9307,x:33060,y:33012,varname:node_9307,prsc:2|A-7829-A,B-3883-OUT;n:type:ShaderForge.SFN_Multiply,id:9357,x:32219,y:33057,varname:node_9357,prsc:2|A-5806-OUT,B-2923-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8541,x:31716,y:33396,ptovrint:False,ptlb:time_multiplier,ptin:_time_multiplier,varname:node_8541,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.15;proporder:7829-9168-3484-5148-9033-2923-2342-9886-8541;pass:END;sub:END;*/

Shader "Shader Forge/worldspace_uv_sheen" {
    Properties {
        _diffuse ("diffuse", 2D) = "white" {}
        _emissivepower ("emissive power", Float ) = 1
        _tint ("tint", Color) = (1,1,1,1)
        _size ("size", Float ) = 0.05
        _offset_sin ("offset_sin", Float ) = 1
        _alphasize ("alphasize", Float ) = 100
        _offset_cos ("offset_cos", Float ) = 0.5
        _sheen_alpha ("sheen_alpha", 2D) = "white" {}
        _time_multiplier ("time_multiplier", Float ) = 0.15
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            uniform float _size;
            uniform float _emissivepower;
            uniform float4 _tint;
            uniform float _offset_sin;
            uniform float _alphasize;
            uniform float _offset_cos;
            uniform sampler2D _sheen_alpha; uniform float4 _sheen_alpha_ST;
            uniform float _time_multiplier;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float2 node_5806 = (i.posWorld.rgb.rg*_size);
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(node_5806, _diffuse));
                float4 node_9292 = _Time + _TimeEditor;
                float2 node_1532 = ((node_5806*_alphasize)+(node_9292.b*_time_multiplier)*float2(1,3));
                float4 _sheen_alpha_var = tex2D(_sheen_alpha,TRANSFORM_TEX(node_1532, _sheen_alpha));
                float4 node_3469 = _Time + _TimeEditor;
                float4 node_6828 = _Time + _TimeEditor;
                float3 emissive = ((_diffuse_var.rgb*(_emissivepower*_tint.rgb))+(_diffuse_var.a*(_sheen_alpha_var.rgb*((sin((node_3469.g*_offset_sin))*0.5+0.5)*(cos((node_6828.g*_offset_cos))*0.5+0.5)))));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
