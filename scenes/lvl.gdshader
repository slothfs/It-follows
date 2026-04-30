shader_type canvas_item;

uniform vec4 base_color : source_color = vec4(0.92, 0.92, 0.92, 1.0);
uniform vec4 wave_color : source_color = vec4(0.82, 0.82, 0.82, 1.0);

uniform float speed = 0.5;
uniform float strength = 0.03;
uniform float scale = 6.0;

void fragment() {
	vec2 uv = UV * scale;

	// smooth wobble using sine waves
	float wave =
		sin(uv.x + TIME * speed) +
		sin(uv.y + TIME * speed * 0.8);

	wave *= 0.5;

	// blend colors softly
	float t = smoothstep(-1.0, 1.0, wave * strength * 50.0);

	vec3 color = mix(base_color.rgb, wave_color.rgb, t);

	COLOR = vec4(color, 1.0);
}