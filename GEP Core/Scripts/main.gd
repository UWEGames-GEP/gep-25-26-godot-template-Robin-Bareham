extends Node3D

@export var item_scene: PackedScene
# UI States information
enum game_state {PAUSE,GAME,INVENTORY}
var current_state = game_state.GAME
var previous_state = game_state.GAME

func _physics_process(delta):
	 
	# Input Handling for UI Changes.
	if(Input.is_action_just_pressed("pause")):
		if(current_state == game_state.GAME):
			current_state = game_state.PAUSE
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			$UserInterface/Pause.show()
		elif(current_state == game_state.PAUSE):
			current_state = game_state.GAME
			Input.mouse_mode =Input.MOUSE_MODE_CONFINED_HIDDEN
			$UserInterface/Pause.hide()
	
	if(Input.is_action_just_pressed("inventory")):
		if(current_state == game_state.GAME):
			current_state = game_state.INVENTORY
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			$UserInterface/Inventory.show()
		elif(current_state == game_state.INVENTORY):
			current_state = game_state.GAME
			Input.mouse_mode =Input.MOUSE_MODE_CONFINED_HIDDEN
			$UserInterface/Inventory.hide()
			
			
	#Colliding with an object
	#for i in item_scene.items._get_item_list().size(): 
		##Checks if Player is colliding with items.
		##If they are, add item.
		#pass
	
