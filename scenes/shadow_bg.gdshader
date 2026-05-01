shader_type canvas_item;

uniform float glitch_power = 12.0;
uniform float flicker_speed = 20.0;

void fragment()
{
	vec2 uv = UV;

	// Strong horizontal distortion
	float wave = sin(TIME * flicker_speed + uv.y * 40.0) * 0.03;
	uv.x += wave;

	// RGB split glitch
	float r = texture(TEXTURE, uv + vec2(0.01, 0.0)).r;
	float g = texture(TEXTURE, uv).g;
	float b = texture(TEXTURE, uv - vec2(0.01, 0.0)).b;

	vec4 color = vec4(r, g, b, texture(TEXTURE, uv).a);

	// Dark pulse flicker
	float flicker = abs(sin(TIME * 25.0)) * 0.4;
	color.rgb -= flicker;

	// Random black flash feel
	float flash = step(0.95, sin(TIME * 12.0));
	color.rgb *= 1.0 - flash * 0.5;

	COLOR = color;
}