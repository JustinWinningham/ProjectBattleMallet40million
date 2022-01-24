# This is a class for maps and all data related to them - namely terrain
class_name Map

var mapPath
# mapData
var mapName
var mapAuthor
var tileSet
# terrainData
var mapSizeX
var mapSizeY
var terrainData = []
# setupData
var startingUnitsP1 = []
var startingUnitsP2 = []

var mapDataDict = {}
var setupDataDict = {}

func _init(path):
	self.mapPath = path
	var file = File.new()
	file.open(path + "/mapData.json", file.READ)
	self.mapDataDict = GLOBAL.parseJSON(file)
	file.close()
	self.mapName = mapDataDict["mapName"]
	self.mapAuthor = mapDataDict["author"]
	self.tileSet = load("res://Tilesets/" + mapDataDict["tileset"])
	# Left off setting the mode to atlas - dont think it worked previously anyway
	
	file.open(path + "/terrainData.csv", file.READ)
	var text = file.get_as_text()
	file.close()
	var newtext = text.replace(',','')
	var row = []
	for c in newtext:
		if c != '\n':
			row.append(c)
		else:
			terrainData.append(row)
			row = []
	self.mapSizeX = terrainData.size()
	self.mapSizeY = terrainData[1].size()
	
	file.open(path + "/setupData.json", file.READ)
	self.setupDataDict = GLOBAL.parseJSON(file)
	file.close()
	
	for g in setupDataDict["OffsetUnitStartPositionTeamA"].size():
		startingUnitsP1.append(setupDataDict["OffsetUnitStartPositionTeamA"][g])
	for u in setupDataDict["OffsetUnitStartPositionTeamB"].size():
		startingUnitsP2.append(setupDataDict["OffsetUnitStartPositionTeamB"][u])
