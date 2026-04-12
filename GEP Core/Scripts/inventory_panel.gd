extends Panel

@onready var item_button: Button = $Button
@onready var item_counter:Label = $Counter

var item_visible = false
var current_item = "Null"
var counter_num = 0
signal item_removal(item, count)

func _change_item_texture(new_texture, item_name):
	item_button.set_button_icon(load(new_texture))
	current_item = item_name
	item_visible = true
	item_counter.visible = true
	counter_num = 1
	item_counter.text = str(counter_num)
	
func _keep_item_texture(new_texture):
	item_visible = true
	item_counter.visible = true
	item_button.set_button_icon(load(new_texture))
	
func _hide_item():
	item_button.set_button_icon(load("res://GEP Core/Assets/Buttons/TransparentBtn.png"))
	item_visible = false
	item_counter.visible = false
	counter_num = 0
	item_counter.text = str(counter_num)

func _reset_panel():
	current_item = "Null"

func _on_button_pressed() -> void:
	if(item_visible):
		#print_debug("Counter_NUMBER: ", counter_num, " Item: ", current_item)
		counter_num -= 1
		if(counter_num <= 0):
			_hide_item()
		else:
			item_counter.text = str(counter_num)
		item_removal.emit(current_item, counter_num)

func _get_current_item():
	return current_item

func _get_counter_num():
	return counter_num
	
func _increase_counter_num():
	counter_num += 1
	item_counter.text = str(counter_num)

func _reset_counter_num():
	counter_num = 0  
	item_counter.text = str(counter_num)
