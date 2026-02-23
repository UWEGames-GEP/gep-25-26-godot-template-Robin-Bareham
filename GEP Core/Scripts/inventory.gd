extends ColorRect

@onready var inventory_slots: Array = $NinePatchRect/GridContainer.get_children()

var item_list = [] #For what items are active in the inventory
var object_list = [] #For all objects in overworld
var icon_list = [] #For all icons linked to objects


func _ready():
	#Add objects from tree into object list
	object_list = get_tree().get_nodes_in_group("items")
	#Gets the icons of each object for the inventory
	for i in object_list.size():
		icon_list.append(object_list[i]._get_icon_name())
	pass

func _inventory_opened():
	#Go through list of objects and whats invisble
	item_list = []
	for i in object_list.size():
		if object_list[i]._get_inventory_active():
			item_list.append(object_list[i]._get_icon_name())
			
	#Turn all pngs invisible
	for i in inventory_slots.size():
		inventory_slots[i]._hide_item()
		
	#Goes through list activating buttons	
	#var current_inv_slot = 0
	for i in item_list.size():
		var texture_location = "res://GEP Core/Assets/Buttons/Item Icons/" + item_list[i] + ".png"
		inventory_slots[i]._change_item_texture(texture_location)
	
	
	pass


func _add_item(item):
	item_list.append(item)

func _remove_item(item):
	item_list.remove(item)

func _get_item_list():
	return item_list
	
func _get_object_list():
	return object_list
