Shader "Custom/Lab06"
{
    Properties
    { 
        _BaseMap("Base Map", 2D) = "white"
    }
    SubShader
    {
        Pass
        {
            // Property
            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION; // Object Space
                float2 uv : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION; // Homogenous Clip Space
                float2 uv : TEXCOORD0;
            };

            TEXTURE2D(_BaseMap);
            SAMPLER(sampler_BaseMap);
            // https://docs.unity3d.com/kr/current/Manual/SL-SamplerStates.html
            
            CBUFFER_START(UnityPerMaterial)
                float4 _BaseMap_ST;
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;

                OUT.positionHCS = TransformObjectToHClip(IN.positionOS.xyz);
                //OUT.uv = IN.uv;
                
                OUT.uv = IN.uv * _BaseMap_ST.xy + _BaseMap_ST.zw;
                //OUT.uv = TRANSFORM_TEX(IN.uv, _BaseMap);
                
                //OUT.uv = IN.uv;                

                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                half4 color = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, IN.uv);
                return color;
            }

            ENDHLSL
        }
    }
}
