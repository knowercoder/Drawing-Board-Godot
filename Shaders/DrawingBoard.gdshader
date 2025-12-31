shader_type canvas_item;

uniform vec4 _bgColor: source_color = vec4(1., 1., 1., 1.);
uniform sampler2D _bufferTex;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 bufferCol = texture(_bufferTex, UV);
	vec4 outcol = mix(_bgColor, bufferCol, floor(bufferCol.a));
	COLOR = outcol;
}
