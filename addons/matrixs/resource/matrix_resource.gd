@tool
@icon("res://addons/matrixs/icons/matrix_resource.svg")
class_name MatrixResource
extends Resource
## A matrix of Resource type values, whose type is determined by resource_types


## Width ranges from 1 to 4
@export_range(1, 4) var width : int = 1 :
	set(value):
		width = value
		_update()

## Height ranges from 1 to 4
@export_range(1, 4) var height : int = 1 :
	set(value):
		height = value
		_update()

## Types of resources which can be added, sperated by commas.
@export_multiline var resource_types := "" :
	set(value):
		resource_types = value
		_update(true)

## Values range from -99 to +99
@export var values := [[null]] :
	set(value):
		if value != null:
			values = value


var size : int = 0


func _init() -> void:
	_update()


func _update(does_clear := false) -> void:
	var old_values := values.duplicate(true) 
	values = []
	size = width * height
	for y in height:
		var arr := []
		arr.resize(width)
		arr.fill(null)
		if not does_clear:
			if y < len(old_values):
				for x in width:
					if x < len(old_values[y]):
						arr[x] = old_values[y][x]
		values.append(arr)


func flip_h() -> void:
	var old_values := values.duplicate()
	for x in width:
		for y in height:
			values[y][x] = old_values[y][width - x - 1]
