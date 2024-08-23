@tool
@icon("res://addons/matrixs/icons/matrix_bool.svg")
class_name MatrixBool
extends Resource


## Width ranges from 1 to 8
@export_range(1, 8) var width : int = 1 :
	set(value):
		width = value
		_update()

## Height ranges from 1 to 8
@export_range(1, 8) var height : int = 1 :
	set(value):
		height = value
		_update()

@export var values := [[true]] :
	set(value):
		if value != null:
			values = value

var size : int = 0


func _init() -> void:
	_update()


func _update() -> void:
	var old_values := values.duplicate(true)
	values = []
	size = width * height
	for y in height:
		var arr := []
		arr.resize(width)
		arr.fill(true)
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
