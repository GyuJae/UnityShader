float Min(float a, float b)
{
    if (a < b)
    {
        return a;
    }
    else
    {
        return b;
    }
}

float Max(float a, float b)
{
    if (a > b)
        return a;
    else
        return b;
}

float Abs(float a)
{
    if (a > 0.0)
        return a;
    else
        return -a;
}

float Clamp(float a, float min, float max)
{
    if (a < min)
        return min;
    if (a > max)
        return max;
    return a;
}

float Saturate(float a)
{
    return Clamp(a, 0, 1);
}

// [a~b] 범위 ratio
float Lerp(float4 a, float4 b, float ratio)
{
    return a * (1 - ratio) + b * ratio;
}