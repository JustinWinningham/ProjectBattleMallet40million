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
		var xpos = mapPointer.startingUnitsP1[x]["xpos"]
		var ypos = mapPointer.startingUnitsP1[x]["ypos"]
		unitLayer[mapPointer.startingUnitsP1[x]["xpos"]][mapPointer.startingUnitsP1[x]["ypos"]] = GLOBAL.getUnitFromId(mapPointer.startingUnitsP1[x]["unitId"])
		drawUnit(unitLayer[mapPointer.startingUnitsP1[x]["xpos"]][mapPointer.startingUnitsP1[x]["ypos"]], xpos, ypos)


func drawUnit(unit: Unit, xpos: int, ypos: int):
	var newSprite = Sprite.new()
	var nameplate = Label.new()
	var theNode = Node2D.new()
	newSprite.texture = unit.defaultIconPath
	theNode.add_child(newSprite)
	nameplate.text = unit.unitName
	theNode.add_child(nameplate)
	theNode.position = Vector2(xpos * 128 + 32, ypos * 128 + 32)
	theNode.add_child(unit)
	unit.state = 0
	$UnitHolder.add_child(theNode)
	
