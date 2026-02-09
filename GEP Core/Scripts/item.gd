@tool
extends CharacterBody3D

@export var item_mesh_name = "NULL"
@export var item_icon_name = "NULL"
@export var item_type = "NULL" #Fruit or veg

#Preloaded textures and meshes
var mat_fruit = preload("res://GEP Core/Assets/Items/Fruit 3D Assets/Materials/M_fruit.tres")
var mat_veg = preload("res://GEP Core/Assets/Items/Fruit 3D Assets/Materials/M_veg.tres")
var tex_fruit = preload("res://GEP Core/Assets/Items/Fruit 3D Assets/Textures/T_fruit_atlas_diffuse.png")
var tex_veg = preload("res://GEP Core/Assets/Items/Fruit 3D Assets/Textures/T_veg_atlas_diffuse.png")

#_ready is the awake function
func _ready():
	#$Pivot/ItemMesh.set_layer_mask_value()
	if(item_type == "veg"):
		$Pivot/ItemMesh.set_surface_override_material(0,mat_veg)
		#$Pivot/ItemMesh.set_texture(tex_veg);
	else:
		$Pivot/ItemMesh.set_surface_override_material(0,mat_fruit)
		#$Pivot/ItemMesh.set_texture(tex_fruit);
	
	#$Pivot/ItemMesh.mesh.GeometryInstance3D.
	#Change mesh to item mesh name
	#change material and texture according to if it's veg or fruit


signal collected

func collect():
	collected.emit()
	print_debug("ITEM GOT")
	
