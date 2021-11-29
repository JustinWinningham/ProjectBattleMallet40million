extends Node2D

var mapPath = null
var terrainData = []
var mapName
var mapAuthor
var mapSizeX
var mapSizeY
var tilesetName
var mapDataDict = {}

var tileSet = 'res://Testing/PlaceholderTileSet.tres'

# Called when the node enters the scene tree for the first time.
func _ready():
	mapPath = GLOBAL._getMap() # get the exact directory to load map from
	var file = File.new()
	file.open(mapPath + "/mapData.json", file.READ)
	var text = file.get_as_text()
	var result_json = JSON.parse(text)
	if result_json.error == OK: # if parse doesn't fail
		var data = result_json.result
		print_debug("Successful mapData parse!")
		mapDataDict = data
	else:
		print_debug("Failed to parse mapData for " + mapPath + "/mapData.json")
		print_debug("Error: ", result_json.error)
		print_debug("Error Line: ", result_json.error_line)
		print_debug("Error String: ", result_json.error_string)
	file.close()
	mapName = mapDataDict["mapName"]
	mapAuthor = mapDataDict["author"]
	self.get_node("DebugLabel").set_text(mapName + " by " + mapAuthor)
	
	file.open(mapPath + "/terrainData.csv", file.READ)
	text = file.get_as_text()
	file.close()
	# TODO: Make more expandable. This approach is going to be a problem if we want more than 10 tile types
	var newtext = text.replace(',','')
	print_debug(newtext)
	var row = []
	for c in newtext:
		if c != '\n':
			row.append(c)
		else:
			terrainData.append(row)
			row = []
	print_debug(terrainData)
	pass # Replace with function body.
	
	mapSizeX = terrainData.size()
	mapSizeY = terrainData[1].size()
	print_debug(mapSizeX)
	print_debug(mapSizeY)
	
	$TileMap.tile_set = load('res://Testing/PlaceholderTileSet.tres')
	$TileMap.tile_set.tile_set_tile_mode(2,TileSet.ATLAS_TILE)
	
	for i in mapSizeX:
		for j in mapSizeY:
			$TileMap.set_cell(i+2, j+2, int(terrainData[j][i]) - 1) # formatting adjustment 1 vs 0 start