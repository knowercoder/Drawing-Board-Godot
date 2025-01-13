extends Node

var bufferRectMaterial : ShaderMaterial

var prevMousePos = Vector2(-1000, 0)
var mousePos = Vector2(-1000, 0)

func _ready():	
	bufferRectMaterial = $"../BufferViewport/ColorRect".material	
	
func _process(delta):	
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):		
		mousePos = get_viewport().get_mouse_position()
		bufferRectMaterial.set_shader_parameter("_mousePos", mousePos)
		bufferRectMaterial.set_shader_parameter("_prevMousePos", prevMousePos)		
		prevMousePos = mousePos
	else:
		prevMousePos = Vector2(-1000, 0)
	
	
	
