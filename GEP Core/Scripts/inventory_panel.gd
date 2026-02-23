extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_icon

func _change_item_texture(new_texture):
	item_visual.texture = load(new_texture)
	item_visual.visible = true

func _hide_item():
	item_visual.visible = false
