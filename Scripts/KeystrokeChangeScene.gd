extends Node
# allows this variable to be set in editor - the path of the scene we want to transition to when pressed
export(String) var scenePath = "res://Scenes/Menus/MainMenu.tscn"

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("PAUSE"):
		get_tree().change_scene(scenePath)
