extends Node

func _ready():
	pass # Replace with function body.

func parseJSON(file):
	var text = file.get_as_text()
	var result_json = JSON.parse(text)
	if result_json.error == OK: # if parse doesn't fail
		var data = result_json.result
		return data
	else:
		print_debug("Failed to parse JSON", file.filename)
		print_debug("Error: ", result_json.error)
		print_debug("Error Line: ", result_json.error_line)
		print_debug("Error String: ", result_json.error_string)
		return null
