#@tool
extends Node3D

#@export var item_name = "NULL"
@export var item_icon_name = "NULL"
@export var item_area3d: Area3D
@export var item_node: Node3D

var inventory_active = false

#_process is update() function
func _process(delta: float) -> void:
	
	#print_debug(item_area3d.get_overlapping_bodies().size())
	# If the object sense it being overlapped with the body.
	if(item_area3d.get_overlapping_bodies().size() > 0 && item_node.is_visible_in_tree() && !inventory_active):
		item_node.visible = false
		inventory_active = true
		
func _reactivate_item():
	var rng = RandomNumberGenerator.new()
	#Changing position 
	#print_debug("Player Direction: ", Global.player_direction.x, " Player Direction: ", Global.player_direction.z )
	#print_debug("Player POS: ", Global.player_position.x, "Player POS: ", Global.player_position.z)
	#print_debug("Item Original Pos: ", item_node.position.x, "Item Original Pos: ", item_node.position.z )
	
	var new_pos_x = (Global.player_position.x + 3 * Global.player_direction.x) + rng.randf_range(-3, 3)
	var new_pos_z = (Global.player_position.z + 3 * Global.player_direction.z) + rng.randf_range(-3, 3)
	
	item_node.global_position = Vector3(new_pos_x, item_node.global_position.y,	new_pos_z )
	#print_debug("Item NEW Pos: ", item_node.position.x, "Item NEW Pos: ", item_node.position.z )
		
	item_node.visible = true
	inventory_active = false
	
	#Stops it from picking up immediently when dropping for the first time
	item_area3d.monitoring = false
	await get_tree().physics_frame
	item_area3d.monitoring = true

func _get_icon_name():
	return item_icon_name
	
func _get_inventory_active():
	return inventory_active
