class_name UnitMetaData

var id
var unitName
var author = ""
var description = ""
var unitDataDict = {}

var unitTags = [] # Fill with Enums (Infantry, Armor, Transport, Aircraft, Hero, etc)
var validWeapons = []
var validEquipment = []
var validOthers = []

var defaultWeapons = []
var defaultEquipment = []
var defaultOthers = []

var abilities = []
var magics = []
# Stat block - placeholder stats for now just to get things working (with default values)
var cost = 0
var defense = 1
var offense = 1
var speed = 1

var isValid = true

func _init(filePath: String):
	var file = File.new()
	file.open(filePath + "/unitData.json", file.READ)
	self.unitDataDict = GLOBAL.parseJSON(file)
	file.close()
	self.id = unitDataDict["unitId"]
	self.unitName = unitDataDict["unitName"]
	self.author = unitDataDict["author"]
	self.description = unitDataDict["description"]
	self.unitTags = unitDataDict["tags"]


func isValid():
	return self.isValid
