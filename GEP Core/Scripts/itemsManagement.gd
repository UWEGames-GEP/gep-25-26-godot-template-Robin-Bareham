extends CharacterBody3D

#Export for now to see if it works
@export var item_list = []
@export var object_list = []

func _add_item(item):
	item_list.add(item)
	pass
	
func _remove_item(item):
	item_list.remove(item)
	pass

func _get_item_list():
	return item_list
	
func _get_object_list():
	return object_list
