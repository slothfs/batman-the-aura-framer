shader_type canvas_item;

uniform float shake_strength = 0.02;
uniform float glitch_strength = 0.05;
uniform float speed = 5.0;

void fragment() {
    vec2 uv = UV;

    float t = TIME * speed;

    // BIG vertical movement (obvious)
    uv.y += sin(t * 2.0) * 0.03;

    // Hard glitch slices
    float line = step(0.8, fract(uv.y * 10.0 + t));
    uv.x += line * sin(t * 50.0) * glitch_strength;


    // Strong shake
    uv.x += (sin(t * 30.0) * shake_strength);
    uv.y += (cos(t * 25.0) * shake_strength);

    COLOR = texture(TEXTURE, uv);
}
