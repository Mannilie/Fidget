// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.18 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.18;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4013,x:33259,y:32716,varname:node_4013,prsc:2|spec-9106-OUT,gloss-9953-OUT,emission-2292-OUT,clip-7887-A,voffset-549-OUT;n:type:ShaderForge.SFN_Multiply,id:2292,x:32910,y:32916,varname:node_2292,prsc:2|A-9631-OUT,B-9568-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9568,x:32593,y:33085,ptovrint:False,ptlb:emissive strength,ptin:_emissivestrength,varname:node_2074,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Color,id:953,x:32370,y:32798,ptovrint:False,ptlb:tint colour,ptin:_tintcolour,varname:node_2398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:7887,x:32370,y:32585,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_2794,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:9953,x:32979,y:32847,ptovrint:False,ptlb:gloss,ptin:_gloss,varname:_specular_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:9106,x:32979,y:32765,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_8271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Panner,id:5780,x:32030,y:33202,varname:node_5780,prsc:2,spu:0.1,spv:0.1|DIST-2443-TSL;n:type:ShaderForge.SFN_ValueProperty,id:873,x:31932,y:33549,ptovrint:False,ptlb:noise amount,ptin:_noiseamount,varname:_noiseamount_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Time,id:2802,x:31859,y:33644,varname:node_2802,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:2559,x:32092,y:33885,ptovrint:False,ptlb:movement amount,ptin:_movementamount,varname:_movementamount_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.3;n:type:ShaderForge.SFN_Sin,id:9847,x:32153,y:33594,varname:node_9847,prsc:2|IN-905-OUT;n:type:ShaderForge.SFN_Multiply,id:1547,x:32399,y:33718,varname:node_1547,prsc:2|A-9847-OUT,B-2559-OUT;n:type:ShaderForge.SFN_Color,id:7850,x:32478,y:33832,ptovrint:False,ptlb:direction,ptin:_direction,varname:_direction_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9212,x:32706,y:33805,varname:node_9212,prsc:2|A-1547-OUT,B-7850-RGB;n:type:ShaderForge.SFN_VertexColor,id:4981,x:32777,y:33631,varname:node_4981,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9676,x:32603,y:33546,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:1519,x:32827,y:33403,varname:node_1519,prsc:2|A-926-OUT,B-9676-OUT;n:type:ShaderForge.SFN_ComponentMask,id:926,x:32625,y:33331,varname:node_926,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-4845-RGB;n:type:ShaderForge.SFN_Tex2d,id:4845,x:32383,y:33298,ptovrint:False,ptlb:noise texture,ptin:_noisetexture,varname:_noisetexture_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e958c6041cfe445e987c73751e8d4082,ntxv:0,isnm:False|UVIN-5065-OUT;n:type:ShaderForge.SFN_Multiply,id:5065,x:32220,y:33379,varname:node_5065,prsc:2|A-5780-UVOUT,B-873-OUT;n:type:ShaderForge.SFN_Multiply,id:1929,x:33048,y:33403,varname:node_1929,prsc:2|A-1519-OUT,B-4981-B;n:type:ShaderForge.SFN_Multiply,id:2993,x:33210,y:33542,varname:node_2993,prsc:2|A-4981-R,B-9212-OUT;n:type:ShaderForge.SFN_Add,id:549,x:33325,y:33383,varname:node_549,prsc:2|A-1929-OUT,B-2993-OUT;n:type:ShaderForge.SFN_Time,id:2443,x:31803,y:33279,varname:node_2443,prsc:2;n:type:ShaderForge.SFN_Sin,id:9467,x:31995,y:33369,varname:node_9467,prsc:2|IN-2443-T;n:type:ShaderForge.SFN_Blend,id:7614,x:32600,y:32722,varname:node_7614,prsc:2,blmd:12,clmp:True|SRC-7887-RGB,DST-953-RGB;n:type:ShaderForge.SFN_Lerp,id:9631,x:32793,y:32765,varname:node_9631,prsc:2|A-7887-RGB,B-7614-OUT,T-2147-RGB;n:type:ShaderForge.SFN_Tex2d,id:2147,x:32309,y:33016,ptovrint:False,ptlb:leaf alpha,ptin:_leafalpha,varname:node_2147,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a16bb454f0129d642b4634153895b2cf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:82,x:31859,y:33830,ptovrint:False,ptlb:offset,ptin:_offset,varname:node_82,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Add,id:905,x:32068,y:33747,varname:node_905,prsc:2|A-2802-T,B-82-OUT;proporder:9106-9953-9568-953-7887-2559-7850-4845-873-2147-82;pass:END;sub:END;*/

Shader "Shader Forge/vertexOffset_dblsided_shd" {
    Properties {
        _specular ("specular", Float ) = 0
        _gloss ("gloss", Float ) = 0
        _emissivestrength ("emissive strength", Float ) = 1
        _tintcolour ("tint colour", Color) = (1,1,1,1)
        _diffuse ("diffuse", 2D) = "white" {}
        _movementamount ("movement amount", Float ) = 0.3
        _direction ("direction", Color) = (0,1,0,1)
        _noisetexture ("noise texture", 2D) = "white" {}
        _noiseamount ("noise amount", Float ) = 1
        _leafalpha ("leaf alpha", 2D) = "white" {}
        _offset ("offset", Float ) = 1
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float _emissivestrength;
            uniform float4 _tintcolour;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _gloss;
            uniform float _specular;
            uniform float _noiseamount;
            uniform float _movementamount;
            uniform float4 _direction;
            uniform sampler2D _noisetexture; uniform float4 _noisetexture_ST;
            uniform sampler2D _leafalpha; uniform float4 _leafalpha_ST;
            uniform float _offset;
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
                float4 node_2443 = _Time + _TimeEditor;
                float2 node_5065 = ((o.uv0+node_2443.r*float2(0.1,0.1))*_noiseamount);
                float4 _noisetexture_var = tex2Dlod(_noisetexture,float4(TRANSFORM_TEX(node_5065, _noisetexture),0.0,0));
                float4 node_2802 = _Time + _TimeEditor;
                v.vertex.xyz += (((_noisetexture_var.rgb.r*v.normal)*o.vertexColor.b)+(o.vertexColor.r*((sin((node_2802.g+_offset))*_movementamount)*_direction.rgb)));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
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
                float4 _leafalpha_var = tex2D(_leafalpha,TRANSFORM_TEX(i.uv0, _leafalpha));
                float3 emissive = (lerp(_diffuse_var.rgb,saturate((_diffuse_var.rgb > 0.5 ?  (1.0-(1.0-2.0*(_diffuse_var.rgb-0.5))*(1.0-_tintcolour.rgb)) : (2.0*_diffuse_var.rgb*_tintcolour.rgb)) ),_leafalpha_var.rgb)*_emissivestrength);
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            #pragma glsl
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform float _emissivestrength;
            uniform float4 _tintcolour;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _gloss;
            uniform float _specular;
            uniform float _noiseamount;
            uniform float _movementamount;
            uniform float4 _direction;
            uniform sampler2D _noisetexture; uniform float4 _noisetexture_ST;
            uniform sampler2D _leafalpha; uniform float4 _leafalpha_ST;
            uniform float _offset;
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
                float4 node_2443 = _Time + _TimeEditor;
                float2 node_5065 = ((o.uv0+node_2443.r*float2(0.1,0.1))*_noiseamount);
                float4 _noisetexture_var = tex2Dlod(_noisetexture,float4(TRANSFORM_TEX(node_5065, _noisetexture),0.0,0));
                float4 node_2802 = _Time + _TimeEditor;
                v.vertex.xyz += (((_noisetexture_var.rgb.r*v.normal)*o.vertexColor.b)+(o.vertexColor.r*((sin((node_2802.g+_offset))*_movementamount)*_direction.rgb)));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
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
            #pragma glsl
            uniform float4 _TimeEditor;
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float _noiseamount;
            uniform float _movementamount;
            uniform float4 _direction;
            uniform sampler2D _noisetexture; uniform float4 _noisetexture_ST;
            uniform float _offset;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 node_2443 = _Time + _TimeEditor;
                float2 node_5065 = ((o.uv0+node_2443.r*float2(0.1,0.1))*_noiseamount);
                float4 _noisetexture_var = tex2Dlod(_noisetexture,float4(TRANSFORM_TEX(node_5065, _noisetexture),0.0,0));
                float4 node_2802 = _Time + _TimeEditor;
                v.vertex.xyz += (((_noisetexture_var.rgb.r*v.normal)*o.vertexColor.b)+(o.vertexColor.r*((sin((node_2802.g+_offset))*_movementamount)*_direction.rgb)));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
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
