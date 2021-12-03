# This is a class object script for Units - generally contained within a Faction object

var id
var name
# TODO: May be better to store this as a bunch of booleans for efficency so we dont have to
# search and entire array multiple times per interaction between two units to interaction checking
# and damage calculation
var unitTags = [] # Fill with Enums (Infantry, Armor, Transport, Aircraft, Hero, etc)
var moveSet = []
var equipment = []

# Stat block - placeholder stats for now just to get things working
var defense
var offense
# TODO: Think about how we want store stats at the data layer
# need second pass on design to be more exact

# Map animation frame data
var idleFrames = []
var sideWalkFrames = []
var upWalkFrames = []
var downWalkFrames = []



func _init():
	pass
