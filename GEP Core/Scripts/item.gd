extends CharacterBody3D

@export var item_name = "NULL"
@export var item_icon = "null"

signal collected

func collect():
	collected.emit()
	print_debug("ITEM GOT")
	
