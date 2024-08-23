extends EditorProperty


var spin_box := preload("res://addons/matrixs/int/matrix_int_spin_box.tscn")

var top_prop := GridContainer.new()
var property_controls : Array[SpinBox] = []
var property_controls_parents : Array[Control] = []

var is_init := false
var current_size : int = 0
var current_index : int = -1
var current_value : int = 0

var updating := false


func _init() -> void:
	add_child(top_prop)
	top_prop.add_theme_constant_override("h_separation", 0)
	top_prop.add_theme_constant_override("v_separation", 0)


func _process(_delta: float) -> void:
	if get_edited_object() != null and current_size != get_edited_object().size and not updating:
		updating = true
		current_size = get_edited_object().size
		initialize()
		updating = false


func _update_property():
	if get_edited_object() == null:
		is_init = false
		return
	
	if current_index == -1:
		return
	
	if property_controls.is_empty() or current_index >= len(property_controls):
		return
	
	var new_value : int = property_controls[current_index].value
	if new_value == current_value:
		return
	
	updating = true
	var pos := index_to_pos(current_index)
	get_edited_object().values[pos.y][pos.x] = new_value
	refresh_controls()
	updating = false


func initialize():
	current_index = -1
	for box in property_controls_parents:
		box.queue_free()
	property_controls.clear()
	property_controls_parents.clear()
	
	top_prop.columns = get_edited_object().width
	
	for i : int in get_edited_object().size:
		var int_spin_box := spin_box.instantiate()
		var box : SpinBox = int_spin_box.get_node("Clip/SpinBox")
		
		top_prop.add_child(int_spin_box)
		add_focusable(box)
		
		box.min_value = MatrixInt.VALUE_MIN
		box.max_value = MatrixInt.VALUE_MAX
		
		var line_edit = box.get_line_edit()
		line_edit.context_menu_enabled = false
		box.alignment = HORIZONTAL_ALIGNMENT_RIGHT
		
		var index := i + 0
		box.value_changed.connect(_on_value_changed.bind(index).unbind(1))
		
		property_controls.append(box)
		property_controls_parents.append(int_spin_box)
		
		var pos := index_to_pos(index)
		box.value = get_edited_object().values[pos.y][pos.x]


func _on_value_changed(index : int):
	if updating:
		return

	current_index = index
	var pos := index_to_pos(index)
	current_value = get_edited_object().values[pos.y][pos.x]
	emit_changed(get_edited_property(), current_index)


func refresh_controls():
	for x in get_edited_object().width:
		for y in get_edited_object().height:
			property_controls[x + (y * get_edited_object().width)].value = get_edited_object().values[y][x]


func index_to_pos(index : int) -> Vector2i:
	return Vector2i(index % get_edited_object().width, floori(float(index) / get_edited_object().width))
