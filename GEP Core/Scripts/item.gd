#@tool
extends Node3D

@export var item_name = "NULL"
@export var item_icon_name = "NULL"

#_ready is the awake function
func _ready():
	pass


signal collected

func collect():
	collected.emit()
	print_debug("ITEM GOT")
	
