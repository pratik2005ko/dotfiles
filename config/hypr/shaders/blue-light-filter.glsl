#version 300 es
precision mediump float;

in vec2 v_texcoord;
layout (location = 0) out vec4 fragColor;

uniform sampler2D tex;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    pixColor[2] *= 0.7;  // reduce blue channel
    pixColor[0] *= 0.97; // slightly reduce red
    pixColor[1] *= 0.95; // slightly reduce green
    fragColor = pixColor;
}