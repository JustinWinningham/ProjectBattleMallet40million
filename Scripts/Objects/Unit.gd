# This is a class object script for Units - generally contained within a Faction object
class_name Unit
extends Node2D

var id
var unitName

var unitTags = [] # Fill with Enums (Infantry, Armor, Transport, Aircraft, Hero, etc)

var weapon
var equipment
var otherequip

var abilities = []
var magics = []
# Stat block - placeholder stats for now just to get things working (with default values)
var cost = 0
var defense = 1
var offense = 1
var speed = 1

var state = 0 #0 = disabled, 1 = can move and attack, 2 = can attack, not move, 3 = can attack, not move

# Map animation frame data
var defaultIconPath = load("res://Art/icon.png")
var body = Sprite.new()
var nametag = Label.new()


var idleFrames = []
var sideWalkFrames = []
var upWalkFrames = []
var downWalkFrames = []

var isValid = true

func _init(metaData: UnitMetaData):
	self.add_child(body)
	self.add_child(nametag)
	self.id = metaData.id
	self.unitName = metaData.unitName
	self.unitTags = metaData.unitTags
	
	self.cost = metaData.cost
	self.offense = metaData.offense
	self.speed = metaData.speed
	body.texture = defaultIconPath
	nametag.text = unitName

func isValid():
	return self.isValid

func copyFrom(other: Unit):
	self.id = other.unitDataDict["unitId"]
	self.unitName = other.unitDataDict["unitName"]
	self.description = other.unitDataDict["description"]
	self.unitTags = other.unitDataDict["tags"]
	
	self.cost = other.unitDataDict["cost"]
	self.speed = other.unitDataDict["speed"]
	return self
