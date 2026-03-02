extends ColorRect

#@export var inventory_panel_scene: PackedScene
@onready var inventory_slots: Array = $NinePatchRect/GridContainer.get_children()

var item_list = [] #For what items are active in the inventory
var object_list = [] #For all objects in overworld
var icon_list = [] #For all icons linked to objects
#signal remove_item_signal

func _ready():
	#Add objects from tree into object list
	object_list = get_tree().get_nodes_in_group("items")
	#Gets the icons of each object for the inventory
	for i in object_list.size():
		icon_list.append(object_list[i]._get_icon_name())
	#Connects signals for removing items
	for i in inventory_slots.size():
		inventory_slots[i].item_removal.connect(_on_removing_item)
	#remove_item_signal.connect(_on_removing_item)

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
		inventory_slots[i]._change_item_texture(texture_location,item_list[i])
	pass


func _on_removing_item(item: Variant):
	_remove_item(item)
	_inventory_opened()
	
func _remove_item(item):
	#Find and remove item from inventory list
	for i in item_list.size():
		if (item_list[i] == item):
			item_list.remove_at(i)
			break
	#find and replace item's real world object
	for i in object_list.size():
		if (object_list[i]._get_inventory_active() && object_list[i]._get_icon_name() == item):
			object_list[i]._reactivate_item()
			break
	

func _get_item_list():
	return item_list
	
func _get_object_list():
	return object_list
