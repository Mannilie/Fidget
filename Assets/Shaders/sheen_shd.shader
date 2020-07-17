// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:33179,y:32708,varname:node_4013,prsc:2|spec-7595-OUT,gloss-4517-OUT,emission-2005-OUT;n:type:ShaderForge.SFN_Color,id:1765,x:31662,y:32704,ptovrint:False,ptlb:tint colour,ptin:_tintcolour,varname:node_2398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1779,x:32328,y:32887,varname:node_1779,prsc:2|A-5965-OUT,B-3614-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3614,x:32101,y:33070,ptovrint:False,ptlb:emissive strength,ptin:_emissivestrength,varname:node_2074,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:4517,x:32519,y:32687,ptovrint:False,ptlb:gloss,ptin:_gloss,varname:_specular_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:7595,x:32508,y:32609,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_8271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:5311,x:31761,y:32465,ptovrint:False,ptlb:node_5311,ptin:_node_5311,varname:node_5311,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:2005,x:32841,y:32909,varname:node_2005,prsc:2|A-1779-OUT,B-1370-OUT;n:type:ShaderForge.SFN_Blend,id:5965,x:31942,y:32636,varname:node_5965,prsc:2,blmd:12,clmp:False|SRC-5311-RGB,DST-1765-RGB;n:type:ShaderForge.SFN_Panner,id:6982,x:31947,y:33436,varname:node_6982,prsc:2,spu:1,spv:1|DIST-3080-OUT;n:type:ShaderForge.SFN_Time,id:3837,x:31522,y:33410,varname:node_3837,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3080,x:31748,y:33458,varname:node_3080,prsc:2|A-3837-TTR,B-6724-OUT;n:type:ShaderForge.SFN_Multiply,id:4314,x:32839,y:33381,varname:node_4314,prsc:2|A-1206-OUT,B-5486-OUT;n:type:ShaderForge.SFN_Time,id:9976,x:31623,y:33761,varname:node_9976,prsc:2;n:type:ShaderForge.SFN_Sin,id:5305,x:32155,y:33823,varname:node_5305,prsc:2|IN-8390-OUT;n:type:ShaderForge.SFN_RemapRange,id:3219,x:32384,y:33797,varname:node_3219,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-5305-OUT;n:type:ShaderForge.SFN_Multiply,id:8390,x:31908,y:33863,varname:node_8390,prsc:2|A-9976-T,B-3869-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3869,x:31709,y:33991,ptovrint:False,ptlb:offset_sin,ptin:_offset_sin,varname:node_9033,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:5486,x:32660,y:33801,varname:node_5486,prsc:2|A-3219-OUT,B-1896-OUT;n:type:ShaderForge.SFN_Time,id:6683,x:31761,y:34115,varname:node_6683,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:5179,x:31761,y:34324,ptovrint:False,ptlb:offset_cos,ptin:_offset_cos,varname:_node_9033_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:6780,x:32027,y:34189,varname:node_6780,prsc:2|A-6683-T,B-5179-OUT;n:type:ShaderForge.SFN_RemapRange,id:1896,x:32473,y:34111,varname:node_1896,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2079-OUT;n:type:ShaderForge.SFN_Cos,id:2079,x:32247,y:34179,varname:node_2079,prsc:2|IN-6780-OUT;n:type:ShaderForge.SFN_Tex2d,id:3482,x:32332,y:33429,ptovrint:False,ptlb:sheen_alpha,ptin:_sheen_alpha,varname:node_9886,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:9cb4ce147db0f2647a7f97a443bad571,ntxv:0,isnm:False|UVIN-5355-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6724,x:31508,y:33638,ptovrint:False,ptlb:time_multiplier,ptin:_time_multiplier,varname:node_8541,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:1370,x:32530,y:33194,varname:node_1370,prsc:2|A-5311-A,B-4314-OUT;n:type:ShaderForge.SFN_Vector1,id:2754,x:31947,y:33682,varname:node_2754,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:5355,x:32149,y:33429,varname:node_5355,prsc:2|A-6982-UVOUT,B-2754-OUT;n:type:ShaderForge.SFN_Multiply,id:1206,x:32530,y:33412,varname:node_1206,prsc:2|A-3482-RGB,B-7590-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7590,x:32350,y:33634,ptovrint:False,ptlb:brightness,ptin:_brightness,varname:node_7590,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;proporder:7595-4517-1765-3614-5311-3869-5179-3482-6724-7590;pass:END;sub:END;*/

Shader "Shader Forge/sheen_shd" {
    Properties {
        _specular ("specular", Float ) = 0
        _gloss ("gloss", Float ) = 0
        _tintcolour ("tint colour", Color) = (1,0,0,1)
        _emissivestrength ("emissive strength", Float ) = 1
        _node_5311 ("node_5311", 2D) = "white" {}
        _offset_sin ("offset_sin", Float ) = 1
        _offset_cos ("offset_cos", Float ) = 0.5
        _sheen_alpha ("sheen_alpha", 2D) = "white" {}
        _time_multiplier ("time_multiplier", Float ) = 2
        _brightness ("brightness", Float ) = 2
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float4 _tintcolour;
            uniform float _emissivestrength;
            uniform float _gloss;
            uniform float _specular;
            uniform sampler2D _node_5311; uniform float4 _node_5311_ST;
            uniform float _offset_sin;
            uniform float _offset_cos;
            uniform sampler2D _sheen_alpha; uniform float4 _sheen_alpha_ST;
            uniform float _time_multiplier;
            uniform float _brightness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
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
                float4 _node_5311_var = tex2D(_node_5311,TRANSFORM_TEX(i.uv0, _node_5311));
                float3 node_5965 = (_node_5311_var.rgb > 0.5 ?  (1.0-(1.0-2.0*(_node_5311_var.rgb-0.5))*(1.0-_tintcolour.rgb)) : (2.0*_node_5311_var.rgb*_tintcolour.rgb)) ;
                float4 node_3837 = _Time + _TimeEditor;
                float2 node_5355 = ((i.uv0+(node_3837.a*_time_multiplier)*float2(1,1))*0.5);
                float4 _sheen_alpha_var = tex2D(_sheen_alpha,TRANSFORM_TEX(node_5355, _sheen_alpha));
                float4 node_9976 = _Time + _TimeEditor;
                float4 node_6683 = _Time + _TimeEditor;
                float3 emissive = ((node_5965*_emissivestrength)+(_node_5311_var.a*((_sheen_alpha_var.rgb*_brightness)*((sin((node_9976.g*_offset_sin))*0.5+0.5)*(cos((node_6683.g*_offset_cos))*0.5+0.5)))));
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
            uniform float4 _tintcolour;
            uniform float _emissivestrength;
            uniform float _gloss;
            uniform float _specular;
            uniform sampler2D _node_5311; uniform float4 _node_5311_ST;
            uniform float _offset_sin;
            uniform float _offset_cos;
            uniform sampler2D _sheen_alpha; uniform float4 _sheen_alpha_ST;
            uniform float _time_multiplier;
            uniform float _brightness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
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
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
