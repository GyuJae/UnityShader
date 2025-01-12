Shader "Custom/Lab03"
{
    SubShader
    {
        Pass
        {
            HLSLPROGRAM

            #pragma vertex vert
            #pragma fragment frag_4
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            float4 vert(float4 pos : POSITION) : SV_POSITION
            {
                return TransformObjectToHClip(pos.xyz);
            }

            // 1. 변수 실습
            float4 frag_0(): SV_Target
            {
                // [타입] [이름]
                float a = 1;
                float b = 0.5;

                a = b;
                
                return float4(b, a, 0, 1);
            }

            // 2. 구조체 실습
            float4 frag_1(): SV_Target
            {
                // int, float, bool;
                struct Color
                {
                    float r;
                    float g;
                    float b;
                    float a;
                };

                Color c;
                c.r = 1;
                c.g = 0.5;
                c.b = 0.5;
                c.a = 1;
                
                return float4(c.r, c.g, c.b, c.a);
            }

            // 2. 기본 타입 (Numeric Basic Type) 실습
            // float, float2, float3, float4
            float4 frag_2() : SV_Target
            {
                // rgba , xyzw
                // [r][g][b][a]
                // [x][y][z][w]
                float4 c;
                c.r = 0;
                c.g = 0;
                c.b = 0;
                c.a = 1;

                float4 c1 = float4(1, 0, 0, 1);
                // return c1.rrrr;

                float c4 = float4(1, 0, 0, 1);
                return float4(c.rrr, 0.1);

                // float c = 0.5;
                // return c; float4(c, c, c, c)
            }

            // 3. 데이터 가공 (산술 연산 : +-*/)
            float4 frag_4() : SV_Target
            {
                float c4 = float4(1, 1, 1, 1);
                c4 *= 0.1;
                return c4;
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
