shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;

uniform float blur_strength = 5.0;
uniform float alpha = 0.6;

void fragment() {
	vec2 uv = SCREEN_UV;

	vec4 col = vec4(0.0);
	float count = 0.0;

	
	for (int x = -2; x <= 2; x++) {
		for (int y = -2; y <= 2; y++) {
			vec2 offset = vec2(float(x), float(y)) * blur_strength / 1000.0;
			col += texture(screen_texture, uv + offset);
			count += 1.0;
		}
	}

	col /= count;

	col.a = alpha;

	COLOR = col;
}