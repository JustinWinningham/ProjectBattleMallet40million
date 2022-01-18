# This script handles loading maps from files and storing them for game access
extends Node

var mapPathArray = []
var _curMapIdx = 0
var masterMapArray = []
export var mapsPath = 'res://Content/Maps/'


func _ready():
	reloadMaps()


func reloadMaps():
	mapPathArray = []
	GLOBAL.reloadDirectory(mapsPath, mapPathArray)
	var mapCode = validateAndLoadMaps()
	
	if mapCode != '0':
		print_debug("error map code: " + str(mapCode))
		get_tree().quit()


func validateAndLoadMaps():
	var fileChecker = File.new()
	for d in mapPathArray:
		var mapDataPath = mapsPath + d + '/mapData.json'
		var terrainDataPath = mapsPath + d + '/terrainData.csv'
		var unitDataPath = mapsPath + d + '/unitData.json'
		# Check for each of the required files per map - ensure they exist
		print_debug("Checking map: " + d)
		if not fileChecker.file_exists(mapDataPath):
			return ("Unable to find " + mapDataPath)
		if not fileChecker.file_exists(terrainDataPath):
			return ("Unable to find " + terrainDataPath)
		if not fileChecker.file_exists(unitDataPath):
			return ("Unable to find " + unitDataPath)
		#fileChecker.open(mapDataPath)
		var errors = validateMapData(mapDataPath)
		if errors != '0':
			print_debug("validateMapData error" + str(errors))
			return errors
		errors = validateTerrainData(terrainDataPath)
		
		if errors != '0':
			print_debug("validateTerrainData error" + str(errors))
			return errors
			
		errors = validateUnitData(unitDataPath)
		
		# At this point we have validated all of the data within the files
		# So we can officially load the map into the master map array for use
		if errors == '0':
			var goodMap = Map.new(mapsPath + d)
			masterMapArray.append(goodMap)
		else:
			print_debug("returning errors" + str(errors))
			return errors
			
	# TODO: not return character codes and instead return null for no error and
	# descriptive codes or Error object instances
	return '0' 

# TODO: Actually validate the data - we are just pretending right now and dealing with the crash
func validateMapData(filepath):
	return '0'

func validateTerrainData(filepath):
	return '0'

func validateUnitData(filepath):
	return '0'
