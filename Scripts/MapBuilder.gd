extends Node2D

func _ready():
	$TileMap.tile_set = MAPCUSTODIAN.getTileSet()
	$TileMap.tile_set.tile_set_tile_mode(2,TileSet.ATLAS_TILE)
	
	$DebugLabel.set_text(MAPCUSTODIAN.getMapName() + " by " + MAPCUSTODIAN.getMapAuthor())
	
	for i in MAPCUSTODIAN.getMapSizeX():
		for j in MAPCUSTODIAN.getMapSizeY():
			$TileMap.set_cell(i+2, j+2, int(MAPCUSTODIAN.getTerrainData(j, i)) - 1) # formatting adjustment 1 vs 0 start
