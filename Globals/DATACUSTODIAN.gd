# This script acts as a go-between for passing data from certain menus to game screens
extends Node

var activeFactions = []
var isNewGame = true

func _ready():
	pass

func setActiveFactions(factions : Array):
	clearActiveFactions()
	for i in factions:
		activeFactions[i] = factions[i]

func getActiveFactions():
	return activeFactions

func numActiveFactions():
	return activeFactions.size()

func clearActiveFactions():
	activeFactions = []

func setIsNewGame(decision):
	isNewGame = decision

func isNewGame():
	return isNewGame
