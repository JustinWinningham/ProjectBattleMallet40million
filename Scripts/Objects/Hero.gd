class_name Hero
extends Unit

var testing

func _init(path).(path):
	print_debug("Created a Hero!")
	pass

func isValid():
	if .isValid(): # call parent class isvalid to ensure valid at the unit level before continuing
		return true
	return false
		
	
