class_name Hero
extends Unit

var testing

# TODO: This init is broken, unsure why. not going to deal with it yet
func _init():
	print_debug("Created a Hero!")
	pass

func isValid():
	if .isValid(): # call parent class isvalid to ensure valid at the unit level before continuing
		return true
	return false
		
	
