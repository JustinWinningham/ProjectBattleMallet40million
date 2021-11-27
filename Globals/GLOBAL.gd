extends Node

var mapToLoad = "res://Maps/testmap"

func _ready():
	pass # Replace with function body.

func setMap(map):
	mapToLoad = map

func _getMap():
	return mapToLoad
