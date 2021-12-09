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
		# There is a bug in this else block - need to investigate
		print_debug("Failed to parse JSON", result_json.filename)
		print_debug("Error: ", result_json.error)
		print_debug("Error Line: ", result_json.error_line)
		print_debug("Error String: ", result_json.error_string)
		return null

func reloadDirectory(path, destinationArray):
	var theDir = Directory.new()
	theDir.open(path)
	theDir.list_dir_begin()
	while true:
		var folder = theDir.get_next()
		if folder == "":
			break
		elif not folder.begins_with("."):
			destinationArray.append(folder)


func reloadDirectoryFolders(path, destinationArray):
	var theDir = Directory.new()
	if theDir.open(path) == OK:
		theDir.list_dir_begin(true, false)
		var file_name = theDir.get_next()
		while file_name != "":
			if theDir.current_is_dir():
				print("Found directory: " + file_name)
				destinationArray.push_back(file_name)
			else:
				print("Found file: " + file_name)
			file_name = theDir.get_next()
			return OK
	else:
		print_debug("Unable to open desired directory: " + path)
		return !OK


func reloadDirectoryFiles(path, destinationArray):
	var theDir = Directory.new()
	if theDir.open(path) == OK:
		theDir.list_dir_begin(true, false)
		var file_name = theDir.get_next()
		while file_name != "":
			if theDir.current_is_dir():
				print("Found directory: " + file_name)
				
			else:
				print("Found file: " + file_name)
				destinationArray.push_back(file_name)
			file_name = theDir.get_next()
			return OK
	else:
		print_debug("Unable to open desired directory: " + path)
		return !OK
