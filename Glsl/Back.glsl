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
    vec3 a = vec3(0.388, 0.388, 0.388);
    vec3 b = vec3(0.258, 0.258, 0.258);
    vec3 c = vec3(3.030, 3.030, 3.030);
    vec3 d = vec3(1.557, 1.727, 0.895);

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
    vec2 uv0 = (2.0 * fragCoord - iR.xy)/iR.y;
    vec3 finalColor = vec3(0.0);

    float o0 = sdOctogon(uv0, 1.7);

    for(float i = 0.0; i<2.; i++){
        
        uv = fract(1.5 * uv) - 0.5;
        float o = sdOctogon(uv, 1.7);
        //o *= exp(-length(o0 ));

        vec3 col = palette(o0 + i * 8. + iTime/8.);

        o = sin(o*sinM - iTime*1.)/sinD;
        o = abs(o);
        o = sinM / (o * 3500.0);
        o = pow(o, 1.1);


        //editing edge1 is some special sauce
        o = smoothstep(0.0, 0.15, o);

        finalColor += col * o;
    }

    

    fragColor = vec4(finalColor , 1.0);


    
}

