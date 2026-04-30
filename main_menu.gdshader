shader_type canvas_item;

uniform float speed = 0.5;
uniform float intensity = 0.15;

void fragment() {
    vec2 uv = UV;

    // Time-based movement
    float t = TIME * speed;

    // Wave motion (horizontal + vertical)
    float wave_x = sin((uv.y * 10.0) + t) * intensity;
    float wave_y = cos((uv.x * 10.0) + t) * intensity;

    uv.x += wave_x;
    uv.y += wave_y;

    // Base color variations (your #000033 tone)
    float shade = 0.5 + 0.5 * sin((uv.x + uv.y + t) * 3.0);

    vec3 base_color = vec3(0.0, 0.0, 0.2); // ~ #000033
    vec3 highlight = vec3(0.0, 0.0, 0.35);

    vec3 color = mix(base_color, highlight, shade);

    COLOR = vec4(color, 1.0);
}