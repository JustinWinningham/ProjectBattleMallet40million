# This script handles loading factions and their units, powers, etc from files and storing them for game access
extends Node

var factionPathArray = []
var factionArray = []
export var factionPath = 'res://Content/Factions/'


func _ready():
	reloadFactions()


func reloadFactions():
	factionArray = []
	GLOBAL.reloadDirectory(factionPath, factionPathArray)
	var factionCode = validateFactions()
	if factionCode == '0':
		pass
	else:
		print_debug(factionCode)
		get_tree().quit()


func validateFactions():
	return '0'
