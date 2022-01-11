# This script handles loading factions and their units, powers, etc from files and storing them for game access
extends Node

var factionPathArray = []
var factionArray = []

export var factionPath = 'res://Content/Factions/'

var currentFaction

func _ready():
	reloadFactions()


func reloadFactions():
	factionArray = []
	GLOBAL.reloadDirectoryFolders(factionPath, factionPathArray)
	if (validateAndLoadFactions() == 0):
		print_debug("All factions loaded")
	else:
		print_debug("Problem loading factions")


func validateAndLoadFactions():
	for f in factionPathArray:
		var currentFaction = Faction.new(factionPath + f)
		if currentFaction.isValid():
			factionArray.push_back(currentFaction)
			currentFaction = null
	return 0
