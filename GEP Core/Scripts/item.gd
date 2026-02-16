#@tool
extends Node3D

@export var item_name = "NULL"
@export var item_icon_name = "NULL"
@export var item_area3d: Area3D
@export var item_node: Node3D

var inventory_active = false

#_ready is the awake function
func _ready():
	pass

func _on_item_area3d_body_enter():
	pass

#_process is update() function
func _process(delta: float) -> void:
	
	#print_debug(item_area3d.get_overlapping_bodies().size())
	
	if(item_area3d.get_overlapping_bodies().size() > 0 && item_node.is_visible_in_tree()):
		print_debug("ITEM GOT")
		item_node.visible = false

		
	

signal collected

func collect():
	collected.emit()
	print_debug("ITEM GOT")
	inventory_active = true
	
