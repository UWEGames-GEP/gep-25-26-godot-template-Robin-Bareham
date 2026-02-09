extends CharacterBody3D

@export var item_name = "NULL"
@export var item_icon_name = "NULL"
@export var item_colour = "NULL"
#var item_mesh = $MeshInstance3D.mesh

#_ready is the awake function
func _ready():
	print_debug(item_name)




signal collected

func collect():
	collected.emit()
	print_debug("ITEM GOT")
	
