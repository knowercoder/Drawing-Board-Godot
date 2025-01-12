shader_type canvas_item;

uniform sampler2D _mainTex;
uniform sampler2D _bufferTex;
uniform vec4 _color : source_color = vec4(0.0, 0.0, 0.0, 1.0);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 mainCol = texture(_mainTex, UV);
	vec4 bufferCol = texture(_bufferTex, UV);
	vec4 outcol = mix(mainCol, _color, floor(bufferCol.r));
	COLOR = outcol;
}
