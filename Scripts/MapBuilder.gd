extends Node2D

func _ready():
	
	# pull the map and factions from the SKIRMISHCUSTODIAN
	var map = MAPCUSTODIAN.masterMapArray[SKIRMISHCUSTODIAN.mapSelectionIndex]
	
	$TileMap.tile_set = map.tileSet
	$TileMap.tile_set.tile_set_tile_mode(2,TileSet.ATLAS_TILE)
	
	$DebugLabel.set_text(map.mapName + " by " + map.mapAuthor)
	
	for i in map.mapSizeX:
		for j in map.mapSizeY:
			$TileMap.set_cell(i+2, j+2, int(map.terrainData[j][i]) - 1) # formatting adjustment 1 vs 0 start
