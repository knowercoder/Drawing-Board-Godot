shader_type canvas_item;

uniform vec4 _color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float _width = 3.0;
uniform vec2 _mousePos;
uniform vec2 _prevMousePos;

varying vec2 localPos;

void vertex() {
	localPos = VERTEX;
}

float distanceToSegment( vec2 a, vec2 b, vec2 p )
{
    vec2 pa = p - a, ba = b - a;
    float h = clamp( dot(pa,ba)/dot(ba,ba), 0.0, 1.0 );
    return length( pa - ba*h );
}

void fragment() {

	vec4 mousePos = vec4(_mousePos, 0.0, 1.0);
    vec4 prevMousePos = vec4(_prevMousePos, 0.0, 1.0);

    float linevalue = 0.0;

    if(prevMousePos.x > -1000.0)
    {
	    float dist = distanceToSegment(mousePos.xy, prevMousePos.xy, VERTEX);
	    if(dist < _width)
	        linevalue += 1.0;
    }

    linevalue = clamp(linevalue, 0.0, 1.0);
	vec4 outColor = vec4(linevalue);

	COLOR = outColor;
}
