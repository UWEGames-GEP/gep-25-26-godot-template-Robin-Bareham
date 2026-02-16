extends Node

enum game_state {PAUSE,GAME,INVENTORY}
var current_state = game_state.GAME
var previous_state = game_state.GAME
