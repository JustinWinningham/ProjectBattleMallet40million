# This is a class object script for Units - generally contained within a Faction object
class_name Unit

var id
var name
var author = ""
var description = ""
var unitDataDict = {}
# TODO: May be better to store this as a bunch of booleans for efficency so we dont have to
# search and entire array multiple times per interaction between two units to interaction checking
# and damage calculation
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
# TODO: Think about how we want store stats at the data layer
# need second pass on design to be more exact

# Map animation frame data
var idleFrames = []
var sideWalkFrames = []
var upWalkFrames = []
var downWalkFrames = []

var isValid = true

# Turn level options
var moved = false
var acted = false



func _init(path):
	var file = File.new()
	file.open(path + "/unitData.json", file.READ)
	self.unitDataDict = GLOBAL.parseJSON(file)
	file.close()
	self.id = unitDataDict["unitName"]
	self.name = unitDataDict["unitId"]
	self.author = unitDataDict["author"]
	self.description = unitDataDict["description"]
	self.unitTags = unitDataDict["tags"]
	
	self.cost = unitDataDict["cost"]
	self.speed = unitDataDict["speed"]
	
	# TEMP FOR TESTING
	self.offense = 1
	self.defense = 2
	
	print_debug("created a regular unit!")
	print_debug(path)

func isValid():
	return self.isValid

func hasActed():
	return moved

func hasMoved():
	return acted

func move():
	if hasMoved():
		return
	# Insert movement logic here
	moved = true

func act():
	if hasActed():
		return
	# Insert action logic here
	acted = true
