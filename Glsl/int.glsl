vec3 palette(float t){

    vec3 a = vec3(-1.5, 0.5, 0);
    vec3 b = vec3(0.5, 0.5, 1);
    vec3 c = vec3(1.0, 2.0, 1.0);
    vec3 d = vec3(0.5, 0, 0);

    return a + b*cos(6.28318*(c*t+d));
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;

    //centering
    uv -= 0.5;
    uv *= 2.0; 

    //fixing aspect ratio, so movement doesn't affect
    uv.x *= iResolution.x/iResolution.y;

    vec2 uv0 = uv;
    vec3 col;
    vec3 finalColor = vec3(0.0);

    for(float i = 0.0; i < 4.0; i++){
        uv = fract(uv*1.5) - 0.5;
    
        uv.x *= iResolution.x/iResolution.y;    
        float d = length(uv);
        d *= exp(-length(uv0)*0.5);
        col = palette(length(uv0) + iTime*.2 );
        //col = vec3(1.0, 1.0, 1.0);
    
        //circles
        d = sin(d*8.0 + iTime)/8.;
        d = abs(d);
    
        //neon function
        d = 0.015/d;
        d = pow(d, 1.5);
        finalColor += col * d;
    }

    
        
    fragColor = vec4(finalColor, 1.0);
}