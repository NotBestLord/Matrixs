@tool
@icon("res://addons/matrixs/icons/matrix_int.svg")
class_name MatrixInt
extends Resource


## Reload project if these are changed.
const VALUE_MIN := -99
const VALUE_MAX := 99


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

## Values range from -99 to +99
@export var values := [[0]] :
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
		arr.fill(0)
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
