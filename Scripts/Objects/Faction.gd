# This is a class object script for Factions
class_name Faction

var id
var factionName
var portrait
var author
var description
var logo
var unitRoster = []
var heroRoster = []
var powers = []
var defaultColor
var factionDataDict = {}
var isValid = true

func _init(path):
	var file = File.new()
	file.open(path + '/factionData.json', file.READ)
	self.factionDataDict = GLOBAL.parseJSON(file)
	file.close()
	self.factionName = factionDataDict["factionName"]
	self.id = factionDataDict["factionId"]
	self.author = factionDataDict["author"]
	self.description = factionDataDict["description"]
	
	var abilitiesPath = path + '/Abilities/'
	var powersPath = path + '/Powers/'
	var basicUnitsPath = path + '/Units/Basic/'
	var heroUnitsPath = path + '/Units/Hero/'
	var errors = 0

	errors += _validateAndLoadPowers(powersPath)
	errors += _validateAndLoadAbilities(abilitiesPath)
	errors += _validateAndLoadHeros(heroUnitsPath)
	errors += _validateAndLoadUnits(basicUnitsPath)
	if errors != 0: self.isValid = false

func setPower(power):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func isValid():
	return self.isValid

# TODO
func _validateAndLoadPowers(path):
	#var fileChecker = File.new()
	return 0

# TODO
func _validateAndLoadAbilities(path):
	#var fileChecker = File.new()
	return 0


func _validateAndLoadHeros(path):
	var herosDir = Directory.new()
	var herosPathArray = []
	herosDir.open(path)
	GLOBAL.reloadDirectoryFolders(path, herosPathArray)
	for h in herosPathArray:
		# Inside individual hero folder
		var newHero = UnitMetaData.new(path + h)
		if newHero.isValid(): self.heroRoster.push_back(newHero)
	return 0


func _validateAndLoadUnits(path):
	var unitsDir = Directory.new()
	var unitsPathArray = []
	unitsDir.open(path)
	GLOBAL.reloadDirectoryFolders(path, unitsPathArray)
	for u in unitsPathArray:
		# Inside individual unit folder
		var newUnit = UnitMetaData.new(path + u)
		if newUnit.isValid(): self.unitRoster.push_back(newUnit)
		
	return 0
