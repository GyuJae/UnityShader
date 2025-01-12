Shader "Custom/Lab01"
{
    SubShader
    {
        Pass
        {
            // Default Shader
            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            float4 vert(float4 pos : POSITION) : SV_POSITION
            {
                return TransformObjectToHClip(pos.xyz);
            }

            float4 frag() : SV_Target
            {
                return float4(1, 0, 0, 1);
            }

            ENDHLSL
        }
    }
}
