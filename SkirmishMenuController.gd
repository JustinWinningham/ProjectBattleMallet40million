extends "res://Scripts/KeystrokeChangeScene.gd"

var _mapNameText = "{mapName} ({index}/{mapCount})"
var _factionText = "{factionName} ({index}/{factionCount})"

func _ready():
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
	SKIRMISHCUSTODIAN.mapSelectionIndex = SKIRMISHCUSTODIAN.mapSelectionIndex - 1
	
	if SKIRMISHCUSTODIAN.mapSelectionIndex < 0:
		SKIRMISHCUSTODIAN.mapSelectionIndex = MAPCUSTODIAN.masterMapArray.size() - 1
	
	MAPCUSTODIAN.setCurrentMap(SKIRMISHCUSTODIAN.mapSelectionIndex)
		
	_setMapLabelText()
	
func _mapSelectRightPressed():
	SKIRMISHCUSTODIAN.mapSelectionIndex = SKIRMISHCUSTODIAN.mapSelectionIndex + 1
	
	if SKIRMISHCUSTODIAN.mapSelectionIndex > MAPCUSTODIAN.masterMapArray.size() - 1:
		SKIRMISHCUSTODIAN.mapSelectionIndex = 0
	
	MAPCUSTODIAN.setCurrentMap(SKIRMISHCUSTODIAN.mapSelectionIndex)
	
	_setMapLabelText()

func _player1FactionLeftPressed():
	SKIRMISHCUSTODIAN.player1FactionIndex = SKIRMISHCUSTODIAN.player1FactionIndex - 1
	
	if SKIRMISHCUSTODIAN.player1FactionIndex < 0:
		SKIRMISHCUSTODIAN.player1FactionIndex = FACTIONCUSTODIAN.factionArray.size() - 1
		
	_setPlayer1FactionText()
	
func _player2FactionLeftPressed():
	SKIRMISHCUSTODIAN.player2FactionIndex = SKIRMISHCUSTODIAN.player2FactionIndex - 1
	
	if SKIRMISHCUSTODIAN.player2FactionIndex < 0:
		SKIRMISHCUSTODIAN.player2FactionIndex = FACTIONCUSTODIAN.factionArray.size() - 1
		
	_setPlayer2FactionText()
	
func _player1FactionRightPressed():
	SKIRMISHCUSTODIAN.player1FactionIndex = SKIRMISHCUSTODIAN.player1FactionIndex + 1
	
	if SKIRMISHCUSTODIAN.player1FactionIndex > FACTIONCUSTODIAN.factionArray.size() - 1:
		SKIRMISHCUSTODIAN.player1FactionIndex = 0
		
	_setPlayer1FactionText()
	
func _player2FactionRightPressed():
	SKIRMISHCUSTODIAN.player2FactionIndex = SKIRMISHCUSTODIAN.player2FactionIndex + 1
	
	if SKIRMISHCUSTODIAN.player2FactionIndex > FACTIONCUSTODIAN.factionArray.size() - 1:
		SKIRMISHCUSTODIAN.player2FactionIndex = 0
		
	_setPlayer2FactionText()
	
func _setMapLabelText():
	
	var mapNameNode = get_node("selection parent/map select parent/map name label")

	mapNameNode.text = _mapNameText.format({
		"mapName": MAPCUSTODIAN.masterMapArray[SKIRMISHCUSTODIAN.mapSelectionIndex].mapName,
		"index": SKIRMISHCUSTODIAN.mapSelectionIndex + 1,
		"mapCount": MAPCUSTODIAN.masterMapArray.size()
	})
	
func _setPlayer1FactionText(): 
	
	var factionNode = get_node("selection parent/team 1 select parent/player 1 faction label")

	factionNode.text = _factionText.format({
		"factionName": FACTIONCUSTODIAN.factionArray[SKIRMISHCUSTODIAN.player1FactionIndex].factionName,
		"index": SKIRMISHCUSTODIAN.player1FactionIndex + 1,
		"factionCount": FACTIONCUSTODIAN.factionArray.size()
	})
	
func _setPlayer2FactionText(): 
	
	var factionNode = get_node("selection parent/team 2 select parent/player 2 faction label")
	
	factionNode.text = _factionText.format({
		"factionName": FACTIONCUSTODIAN.factionArray[SKIRMISHCUSTODIAN.player2FactionIndex].factionName,
		"index": SKIRMISHCUSTODIAN.player2FactionIndex + 1,
		"factionCount": FACTIONCUSTODIAN.factionArray.size()
	})

