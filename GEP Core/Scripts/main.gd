extends Node3D

# UI States information
enum game_state {PAUSE,GAME,INVENTORY}
var current_state = game_state.GAME
var previous_state = game_state.GAME

func _physics_process(delta):
	 
	if(Input.is_action_just_pressed("pause")):
		if(current_state == game_state.GAME):
			current_state = game_state.PAUSE
			$UserInterface/Pause.show()
		elif(current_state == game_state.PAUSE):
			current_state = game_state.GAME
			$UserInterface/Pause.hide()
	
	if(Input.is_action_just_pressed("inventory")):
		if(current_state == game_state.GAME):
			current_state = game_state.INVENTORY
			$UserInterface/Inventory.show()
		elif(current_state == game_state.INVENTORY):
			current_state = game_state.GAME
			$UserInterface/Inventory.hide()
