extends "res://Scripts/KeystrokeChangeScene.gd"

# the map that's currently selected out of the list
var mapSelectionIndex = 0

var player1FactionIndex = 0
var player2FactionIndex = 0

var _mapNameText = "{mapName} ({index}/{mapCount})"
var _factionText = "{factionName} ({index}/{factionCount})"

func _ready():
	# TODO: randomize the map and factions? or make sure the previous selections
	# are preserved
	_setMapLabelText()
	_setPlayer1FactionText()
	_setPlayer2FactionText()
	
func _setMapLabelText():
	
	var mapNameNode = get_node("selection parent/map select parent/map name label")

	mapNameNode.text = _mapNameText.format({
		"mapName": MAPCUSTODIAN.masterMapArray[mapSelectionIndex].mapName,
		"index": mapSelectionIndex + 1,
		"mapCount": MAPCUSTODIAN.masterMapArray.size()
	})
	
func _setPlayer1FactionText(): 
	
	var factionNode = get_node("selection parent/team 1 select parent/player 1 faction label")

	factionNode.text = _factionText.format({
		"factionName": FACTIONCUSTODIAN.factionArray[player1FactionIndex].factionName,
		"index": player1FactionIndex + 1,
		"factionCount": FACTIONCUSTODIAN.factionArray.size()
	})
	
func _setPlayer2FactionText(): 
	
	var factionNode = get_node("selection parent/team 2 select parent/player 2 faction label")
	
	factionNode.text = _factionText.format({
		"factionName": FACTIONCUSTODIAN.factionArray[player2FactionIndex].factionName,
		"index": player2FactionIndex + 1,
		"factionCount": FACTIONCUSTODIAN.factionArray.size()
	})

