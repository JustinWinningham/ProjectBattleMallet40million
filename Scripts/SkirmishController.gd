extends Node2D

var unitLayer = []


func _ready():
	var mapPointer = MAPCUSTODIAN.masterMapArray[MAPCUSTODIAN._curMapIdx]
	#unitLayer.resize(MAPCUSTODIAN.masterMapArray[curmapidx].mapSizeX)
	unitLayer.resize(mapPointer.mapSizeX)
	for x in unitLayer.size():
		for y in unitLayer.size():
			var row = []
			row.resize(unitLayer.size())
			unitLayer[x] = row
	
	var faction1Pointer = FACTIONCUSTODIAN.factionArray[SKIRMISHCUSTODIAN.player1FactionIndex]
	var faction2Pointer = FACTIONCUSTODIAN.factionArray[SKIRMISHCUSTODIAN.player2FactionIndex]

	for x in mapPointer.startingUnitsP1.size():
		unitLayer[mapPointer.startingUnitsP1[x]["xpos"]][mapPointer.startingUnitsP1[x]["ypos"]] = mapPointer.startingUnitsP1[x]["unitId"]
	# Spawn starting units and set turn state to allow P1 to move

#func _process(delta):
#	pass
