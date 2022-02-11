extends Node2D

var unitLayer = []


func _ready():
	var mapPointer = MAPCUSTODIAN.masterMapArray[MAPCUSTODIAN._curMapIdx]
	unitLayer.resize(mapPointer.mapSizeX)
	for x in unitLayer.size():
		for y in unitLayer.size():
			var row = []
			row.resize(unitLayer.size())
			unitLayer[x] = row
	
	var faction1Pointer = FACTIONCUSTODIAN.factionArray[SKIRMISHCUSTODIAN.player1FactionIndex]
	var faction2Pointer = FACTIONCUSTODIAN.factionArray[SKIRMISHCUSTODIAN.player2FactionIndex]

	for x in mapPointer.startingUnitsP1.size():
		var xpos = mapPointer.startingUnitsP1[x]["xpos"]
		var ypos = mapPointer.startingUnitsP1[x]["ypos"]
		unitLayer[mapPointer.startingUnitsP1[x]["xpos"]][mapPointer.startingUnitsP1[x]["ypos"]] = spawnUnit(GLOBAL.getUnitMetaDataFromId(mapPointer.startingUnitsP1[x]["unitId"]), xpos, ypos)

# We will have to redo the vector position placement eventually to account for different screen sizes, but it works for now
func spawnUnit(metaData: UnitMetaData, xpos: int, ypos: int):
	var theUnit = Unit.new(metaData)
	theUnit.position = Vector2(xpos * 128 + 32, ypos * 128 + 32)
	$UnitHolder.add_child(theUnit)
	return theUnit
