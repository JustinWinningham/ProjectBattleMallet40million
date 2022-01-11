extends Node

var teamz = [] # TODO - update with team
var activeUnits = []

var turnNumber = 0
var numTeams
var currentTeam
var currentTurn

var loading

var unitMap = []




func _ready():
	loading = DATACUSTODIAN.isNewGame()
	for i in numTeams:
		var row = []
		activeUnits.push_back(row)
		# fill out empty unit array to hold spawned unit references
		for j in MAPCUSTODIAN.getMapSizeX():
			for k in MAPCUSTODIAN.getMapSizeY():
				unitMap.push_back(row)
	# At this point, our varaibles should be filled out (abeit empty)
	if not loading:
		teamz = DATACUSTODIAN.getActiveFactions() # set our teams in turn order
		numTeams = teamz.size()
		newTurn()
		
	else:
		pass

func _on_DEBUG_ET_Button_pressed():
	newTurn()
	print_debug("New turn started! (" + turnNumber + ")")


func newTurn():
	turnNumber += 1
	currentTurn = Turn.new(turnNumber)
	currentTeam = currentTurn % numTeams
