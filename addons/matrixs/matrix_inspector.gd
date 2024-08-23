extends EditorInspectorPlugin


var MatrixBoolEditor = preload("res://addons/matrixs/bool/matrix_bool_editor.gd")
var MatrixIntEditor = preload("res://addons/matrixs/int/matrix_int_editor.gd")
var MatrixFloatEditor = preload("res://addons/matrixs/float/matrix_float_editor.gd")
var MatrixResourceEditor = preload("res://addons/matrixs/resource/matrix_resource_editor.gd")


func _can_handle(object):
	return ( 
			object is MatrixBool
			or object is MatrixInt
			or object is MatrixFloat
			or object is MatrixResource 
	)


func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if type == TYPE_ARRAY:
		if object is MatrixBool:
			add_property_editor(name, MatrixBoolEditor.new())
		elif object is MatrixInt:
			add_property_editor(name, MatrixIntEditor.new())
		elif object is MatrixFloat:
			add_property_editor(name, MatrixFloatEditor.new())
		elif object is MatrixResource:
			add_property_editor(name, MatrixResourceEditor.new())
		
		return true
	else:
		return false
