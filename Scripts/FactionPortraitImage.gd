extends Image

# Image class for managing faction portraits in the skirmish screen
func _ready():
	pass
	
# sets the portrait resource for this faction2
func setFactionPortrait(resource_name):
	self.resource_name = resource_name
