Shader "Custom/Lab02"
{
    SubShader
    {
        Pass
        {
            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            float4 vert(float4 pos : POSITION) : SV_POSITION
            {
                // 아무것도 안한다면?
                return pos;
                // return TransformObjectToHClip(pos.xyz);
            }

            float4 frag() : SV_Target
            {
                // RGBA - 색상 변경
                return float4(0, 1, 0, 1);
            }

            ENDHLSL
        }
    }
}
