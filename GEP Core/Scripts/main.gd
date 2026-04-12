extends Node3D

@onready var inventory_script: ColorRect = $UserInterface/Inventory

func _physics_process(delta):
	 
	# Input Handling for UI Changes.
	if(Input.is_action_just_pressed("pause")):
		if(Global.current_state == Global.game_state.GAME):
			Global.current_state = Global.game_state.PAUSE
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			$UserInterface/Pause.show()
		elif(Global.current_state == Global.game_state.PAUSE):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			Global.current_state = Global.game_state.GAME
			$UserInterface/Pause.hide()
		elif(Global.current_state == Global.game_state.INVENTORY):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			Global.current_state = Global.game_state.GAME
			$UserInterface/Inventory.hide()
	
	if(Input.is_action_just_pressed("inventory")):
		if(Global.current_state == Global.game_state.GAME):
			inventory_script._inventory_opened()
			Global.current_state = Global.game_state.INVENTORY
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			$UserInterface/Inventory.show()
		elif(Global.current_state == Global.game_state.INVENTORY):
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			Global.current_state = Global.game_state.GAME
			$UserInterface/Inventory.hide()
			
			
