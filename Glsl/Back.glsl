float sdOctogon( in vec2 p, in float r )
{
    const vec3 k = vec3(-0.9238795325, 0.3826834323, 0.4142135623 );
    p = abs(p);
    p -= 2.0*min(dot(vec2( k.x,k.y),p),0.0)*vec2( k.x,k.y);
    p -= 2.0*min(dot(vec2(-k.x,k.y),p),0.0)*vec2(-k.x,k.y);
    p -= vec2(clamp(p.x, -k.z*r, k.z*r), r);
    return length(p)*sign(p.y);
}

vec3 palette(float t){
    vec3 a = vec3(0.548, 0.298, 0.368);
    vec3 b = vec3(0.160, 0.160, 0.160);
    vec3 c = vec3(3., 3., 3.);
    vec3 d = vec3(1.877, 1.902, 0.407);

    return a + b * cos(6.28318*(c*t + d));
}

void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec3 iR = iResolution;
    vec2 sinMultDiv = vec2(8.0, 8.0);
    float sinM = sinMultDiv.x;
    float sinD = sinMultDiv.y;

    // vec2 uv = fragCoord/iR.xy * 2.0 - 1.0;
    // uv.x = uv.x * iR.x / iR.y;
    vec2 uv = (2.0 * fragCoord - iR.xy)/iR.y;

    float o = sdOctogon(uv, 1.7);

    vec3 col = palette(o);

    o = sin(o*sinM - iTime*3.)/sinD;

    o = sinM / (o * 2300.0);

    o = abs(o);
    o = smoothstep(0.0, 0.1, o);

    col *= o;

    fragColor = vec4(col , 1.0);


    
}

