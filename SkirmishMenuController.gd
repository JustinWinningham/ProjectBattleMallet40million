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
	
	_bindButton("selection parent/map select parent/map left button", "_mapSelectLeftPressed")
	_bindButton("selection parent/map select parent/map right button", "_mapSelectRightPressed")
	_bindButton("selection parent/team 1 select parent/player 1 faction left button", "_player1FactionLeftPressed")
	_bindButton("selection parent/team 1 select parent/player 1 faction right button", "_player1FactionRightPressed")
	_bindButton("selection parent/team 2 select parent/player 2 faction left button", "_player2FactionLeftPressed")
	_bindButton("selection parent/team 2 select parent/player 2 faction right button", "_player2FactionRightPressed")


func _bindButton(path: NodePath, functionName):
	get_node(path).connect("pressed", self, functionName)

func _mapSelectLeftPressed():
	mapSelectionIndex = max(mapSelectionIndex - 1, 0) 
	_setMapLabelText()
	
func _mapSelectRightPressed():
	mapSelectionIndex = min(mapSelectionIndex + 1, MAPCUSTODIAN.masterMapArray.size() - 1) 
	_setMapLabelText()

func _player1FactionLeftPressed():
	player1FactionIndex = max(player1FactionIndex - 1, 0) 
	_setPlayer1FactionText()
	
func _player2FactionLeftPressed():
	player2FactionIndex = max(player2FactionIndex - 1, 0) 
	_setPlayer2FactionText()
	
func _player1FactionRightPressed():
	player1FactionIndex = min(player1FactionIndex + 1, FACTIONCUSTODIAN.factionArray.size() - 1) 
	_setPlayer1FactionText()
	
func _player2FactionRightPressed():
	player2FactionIndex = min(player2FactionIndex + 1, FACTIONCUSTODIAN.factionArray.size() - 1) 
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

