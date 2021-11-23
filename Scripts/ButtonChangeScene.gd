extends Button

# allows this variable to be set in editor - the path of the scene we want to transition to when pressed
export(String) var scenePath

func _ready():
	pass

func _pressed():
	get_tree().change_scene(scenePath)
	if get_tree().paused:
		# Unpause the game if we happen to be changing scenes while game is paused
		get_tree().paused = false
