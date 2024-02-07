
float sdCircle( vec2 p, float r )
{
    //float y = length(p) - r;
    float y = sin(length(p));
    //y = smoothstep(0.0, 0.1, y);
    y = sin(y*16. + iTime)/6.;
    y = abs(y);
    y = 0.02/y;
    return y;
}

float sdBox( in vec2 p, in vec2 b )
{
    vec2 d = abs(p)-b;
    float x = length(max(d,-1.5)) + min(max(d.x,d.y),-1.5);
    //x = smoothstep(0.0, 0.1, x);
    x = sin(x*8. + iTime)/8.;
    x = abs(x);
    //x = pow(0.02/x, 2.);
    x = .02/x;
    return x;
}


vec3 palette(float t){

    vec3 a = vec3(.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 1);
    vec3 c = vec3(1.0, 2.0, 1.0);
    vec3 d = vec3(0.5, 0, 0);

    return a + b*cos(6.28318*(c*t+d));
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){

    vec2 uv = fragCoord/iResolution.xy;
    //centering
    uv -= 0.5;
    uv *= 2.0; 
    //fixing aspect ratio, so movement doesn't affect
    uv.x *= iResolution.x/iResolution.y;
    vec2 uv0 = uv;
    vec3 finalColor = vec3(0.0);

    for(float i = 0.0; i < 1.5; i++){
        uv = fract(uv * 1.5) - 0.5;

        //float d = sdCircle(uv, 0.75);
    
        vec2 dimen = vec2(0.25, 0.25);
        float rec = sdBox(uv, dimen);

        rec *= exp(-length(uv0)-.0);

        float pin = length(uv);
        //color variation by iTime
        pin += iTime*0.5;
        vec3 color = palette(pin);

        finalColor += color * rec;
    }

    

    //fragColor = vec4(d, rec, rec, 1.0);
    fragColor = vec4(finalColor, 1.);








}