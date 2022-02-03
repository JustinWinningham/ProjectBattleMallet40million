# This is a class object script for Units - generally contained within a Faction object
class_name Unit
extends Node

var id
var unitName
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
var state = 0 #0 = disabled, 1 = can move and attack, 2 = can attack, not move, 3 = can attack, not move


# Map animation frame data
var defaultIconPath = load("res://Art/icon.png")
var idleFrames = []
var sideWalkFrames = []
var upWalkFrames = []
var downWalkFrames = []

var isValid = true

func init(test):
	return 0

func _init(path):
	if path == null:
		self.id = "nullUnit"
		self.unitName = "nullUnit"
		self.author = "nullAuthor"
		self.description = "This is a null unit!"
		self.unitTags = null
		
		self.cost = 1
		self.speed = 1
		
		# TEMP FOR TESTING
		self.offense = 1
		self.defense = 1
		
		print_debug("created a null unit!")
		return
	
	var file = File.new()
	file.open(path + "/unitData.json", file.READ)
	self.unitDataDict = GLOBAL.parseJSON(file)
	file.close()
	self.id = unitDataDict["unitId"]
	self.unitName = unitDataDict["unitName"]
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

func copyFrom(other: Unit):
	self.id = other.unitDataDict["unitId"]
	self.unitName = other.unitDataDict["unitName"]
	self.author = other.unitDataDict["author"]
	self.description = other.unitDataDict["description"]
	self.unitTags = other.unitDataDict["tags"]
	
	self.cost = other.unitDataDict["cost"]
	self.speed = other.unitDataDict["speed"]
	return self
