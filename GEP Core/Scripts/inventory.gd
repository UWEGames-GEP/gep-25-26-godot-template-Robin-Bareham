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
		inventory_slots[i]._reset_panel()
		
	#Goes through list activating buttons	
	#var current_inv_slot = 0
	for i in item_list.size() : #Goes through each item collected
	#	print_debug("Current Item: ", item_list[i])
		for a in inventory_slots.size(): #Goes through all the panels
			var texture_location = "res://GEP Core/Assets/Buttons/Item Icons/" + item_list[i] + ".png"
	#		print_debug(a, " ", inventory_slots[a]._get_current_item())
			if(inventory_slots[a]._get_current_item() == "Null"):
				inventory_slots[a]._change_item_texture(texture_location,item_list[i])
				break
			#If the item has a same item already in there increase the count
			if (inventory_slots[a]._get_current_item() == item_list[i]):
				inventory_slots[a]._increase_counter_num()
				inventory_slots[a]._keep_item_texture(texture_location);
				break			
	#print_debug(" END OF SORTING ")
	pass


func _on_removing_item(item: Variant, count: Variant):
	if(count > 0):
		_remove_item(item)
	else:
		for a in inventory_slots.size():
			if(inventory_slots[a]._get_current_item() == item):
				inventory_slots[a]._reset_panel()
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
