extends EditorProperty


var top_prop := GridContainer.new()
var property_controls : Array[EditorResourcePicker] = []

var is_init := false
var current_size : int = 0
var current_index : int = -1
var current_value = null
var current_types := ""

var updating := false


func _init() -> void:
	add_child(top_prop)
	top_prop.add_theme_constant_override("h_separation", 0)
	top_prop.add_theme_constant_override("v_separation", 0)


func _process(_delta: float) -> void:
	if (get_edited_object() != null 
			and (current_size != get_edited_object().size or current_types != get_edited_object().resource_types) 
			and not updating):
		updating = true
		current_size = get_edited_object().size
		current_types = get_edited_object().resource_types
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
	
	var new_value = property_controls[current_index].edited_resource
	if new_value == current_value:
		return
	
	updating = true
	var pos := index_to_pos(current_index)
	get_edited_object().values[pos.y][pos.x] = new_value
	refresh_controls()
	updating = false


func initialize():
	current_index = -1
	for box in property_controls:
		box.queue_free()
	property_controls.clear()
	
	top_prop.columns = get_edited_object().width
	
	for i : int in get_edited_object().size:
		var picker := EditorResourcePicker.new()
		
		top_prop.add_child(picker)
		add_focusable(picker)
		
		picker.custom_minimum_size.x = 96
		picker.base_type = get_edited_object().resource_types.replace('\n', '').replace(' ', '')
		
		var index := i + 0
		picker.resource_changed.connect(_on_value_changed.bind(index).unbind(1))
		
		property_controls.append(picker)
		
		var pos := index_to_pos(index)
		picker.edited_resource = get_edited_object().values[pos.y][pos.x]


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
			property_controls[x + (y * get_edited_object().width)].edited_resource = get_edited_object().values[y][x]


func index_to_pos(index : int) -> Vector2i:
	return Vector2i(index % get_edited_object().width, floori(float(index) / get_edited_object().width))
