//
// WIP splat fragment shader
//

uniform mat4 projMat;
uniform float k;
uniform vec2 p;
uniform mat2 rhoInvMat;

varying vec4 frag_color;

void main()
{
    vec2 d = gl_FragCoord.xy - p;
    float g = k * exp(-0.5f * dot(d, rhoInvMat * d));

    // premultiplied alpha blending
    gl_FragColor.rgb = g * frag_color.a * frag_color.rgb;
    gl_FragColor.a = g * frag_color.a;

    float sigma = 100.0f;
    mat2 V;
    V[0] = vec2(1.0 / (sigma * sigma), 0.0);
    V[1] = vec2(0.0, 1.0 / (sigma * sigma));
    float ggg = exp(-0.5f * dot(d, V * d));

    gl_FragColor.rgba = vec4(g, g, g, 1.0);
}