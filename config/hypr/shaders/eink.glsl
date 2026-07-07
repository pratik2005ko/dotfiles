#version 300 es
precision mediump float;

in vec2 v_texcoord;
layout (location = 0) out vec4 fragColor;

uniform sampler2D tex;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);

    // luminance (perceived brightness)
    float gray = dot(pixColor.rgb, vec3(0.299, 0.587, 0.114));

    // boost contrast for that e-ink look
    gray = clamp((gray - 0.5) * 1.5 + 0.5, 0.0, 1.0);

    // warm paper tint
    vec3 paper = vec3(0.95, 0.93, 0.88);
    vec3 ink   = vec3(0.15, 0.13, 0.10);

    vec3 eink = mix(ink, paper, gray);
    fragColor = vec4(eink, pixColor.a);
}