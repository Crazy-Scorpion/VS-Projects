vec3 palette(float t){

    vec3 a = vec3(.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 1);
    vec3 c = vec3(1.0, 2.0, 1.0);
    vec3 d = vec3(0.5, 0, 0);

    return a + b*cos(6.28318*(c*t+d));
}

float sdCross( in vec2 p, in vec2 b, float r ) 
{
    p = abs(p); 
    p = (p.y>p.x) ? p.yx : p.xy;
    vec2  q = p - b;
    float k = max(q.y,q.x);
    vec2  w = (k>0.0) ? q : vec2(b.y-p.x,-k);
    float x = sign(k)*length(max(w,1.5)) + r;
    //x = abs(x);
    x = sin(x*28. + iTime*4.0)/14.;  
    x = .015/x;
    return x;
 
}

void mainImage(out vec4 fragColor, in vec2 fragCoord){
    vec2 uv = fragCoord/iResolution.xy;
    uv -= .5;
    uv *= 2.;

    uv.x *= iResolution.x/iResolution.y;
    vec2 uv0 = uv;
    vec3 finalColor = vec3(0.0);

    for(float i = 0.0; i<2.5; i++){
        //uv = fract(uv * 1.0) - .5;
    
        vec2 dimen = vec2(2.5, -2.5);
        float cross = sdCross(uv, dimen, 0.1);

        float pin = length(uv);
        pin += iTime*1.5;
        vec3 Color = palette(pin);

        cross *= exp(-length(uv0)-.0);

        Color *= cross;
        finalColor += Color*cross; 
    }

    fragColor = vec4(finalColor, 1.);

}