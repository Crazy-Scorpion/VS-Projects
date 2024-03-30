void mainImage(out vec4 fragColor,in vec2 fragCoord){
    vec3 iR = iResolution;
    // vec2 uv = fragCoord/iR.xy * 2.0 - 1.0;
    // uv.x = uv.x * iR.x / iR.y;
    vec2 uv = (2.0 * fragCoord - iR.xy)/iR.y;    
}
