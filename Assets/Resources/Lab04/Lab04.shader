Shader "Custom/Lab04"
{
    SubShader
    {
        Pass
        {
            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS: POSITION;
            };

            float4 vert(float4 pos : POSITION) : SV_POSITION
            {
                return TransformObjectToHClip(pos.xyz);
            }

            float4 frag() : SV_Target
            {
                float4 c1 = float4(1, 0 ,0 ,1);
                float4 c2 = float4(0, 1, 1, 1);
                bool isRich = false;
                
                if (isRich)
                {
                    return c1;
                }
                else
                {
                    return c2;
                }

                // for 어차피 잘 안쓰임;; 
                
                return float4(1, 0, 0, 1);
            }
            ENDHLSL
        }
    }
}
