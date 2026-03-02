extends Panel

@onready var item_button: Button = $Button

var item_visible = false
var current_item = "Null"
signal item_removal(item)

func _change_item_texture(new_texture, item_name):
	item_button.set_button_icon(load(new_texture))
	current_item = item_name
	item_visible = true
	
func _hide_item():
	item_button.set_button_icon(load("res://GEP Core/Assets/Buttons/TransparentBtn.png"))
	item_visible = false

func _on_button_pressed() -> void:
	if(item_visible):
		_hide_item()
		item_removal.emit(current_item)
