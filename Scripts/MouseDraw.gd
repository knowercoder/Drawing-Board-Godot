extends Node

var bufferRectMaterial : ShaderMaterial

var prevMousePos = Vector2(-1000, 0)
var mousePos = Vector2(-1000, 0)

var color_picker: ColorPicker

func _ready():	
	bufferRectMaterial = $"../BufferViewport/ColorRect".material	
	color_picker = $"../ColorPicker"
	color_picker.color_changed.connect(_on_color_changed)
	bufferRectMaterial.set_shader_parameter("_inkColor", color_picker.color)
	
func _process(delta):	
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):		
		mousePos = get_viewport().get_mouse_position()
		bufferRectMaterial.set_shader_parameter("_mousePos", mousePos)
		bufferRectMaterial.set_shader_parameter("_prevMousePos", prevMousePos)
		prevMousePos = mousePos
	else:
		prevMousePos = Vector2(-1000, 0)
	
		
func _on_color_changed(color: Color):
	bufferRectMaterial.set_shader_parameter("_inkColor", color)
	
