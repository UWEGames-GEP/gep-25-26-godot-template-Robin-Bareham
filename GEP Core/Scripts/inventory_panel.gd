extends Panel

@onready var item_button: Button = $Button

var item_image_size = 130
var item_visible = false

func _ready():
	#Connects the action to the button
	item_button.connect("button_down", _on_button_down)

func _change_item_texture(new_texture):
	item_button.set_button_icon(load(new_texture))
	item_visible = true
	
func _hide_item():
	item_button.set_button_icon(load("res://GEP Core/Assets/Buttons/TransparentBtn.png"))
	item_visible = false

func _on_button_down():
	if(item_visible):
		_hide_item()
	pass
