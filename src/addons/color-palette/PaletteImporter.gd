tool
class_name PaletteImporter
extends Reference


# Adapted from Github -> Orama-Interactive/Pixelorama/src/Autoload/Import.gd
static func import_gpl(path : String) -> Palette:
	var result : Palette = null
	
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		var text = file.get_as_text()
		var lines = text.split('\n')
		var line_number := 0
		var comments := ""
		for line in lines:
			# Check if valid Gimp Palette Library file
			if line_number == 0:
				if line != "GIMP Palette":
					push_error("File \"%s\" is not a valid GIMP Palette." % path)
					break
				else:
					result = Palette.new()
					result.path = path
					var name_start = path.find_last('/') + 1
					var name_end = path.find_last('.')
					if name_end > name_start:
						result.name = path.substr(name_start, name_end - name_start)

			# Comments
			elif line.begins_with('#'):
				comments += line.trim_prefix('#') + '\n'
			elif line_number > 0 && line.length() >= 12 and line.substr(0, 1).is_valid_integer():
				line = line.replace("\t", " ")
				var color_data : PoolStringArray = line.split(" ", false, 4)
				var red : float = color_data[0].to_float() / 255.0
				var green : float = color_data[1].to_float() / 255.0
				var blue : float = color_data[2].to_float() / 255.0
				var color = Color(red, green, blue)
				result.add_color(color)
			line_number += 1

		if result:
			result.comments = comments
		file.close()
	else:
		push_error("File \"%s\" does not exist." % path)
		
	return result
	
	
# Get all gpl files in a path
static func get_gpl_files(path) -> Array:
	var files = []
	
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() and file_name.ends_with(".gpl"):
				files.append(path + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the color palette path")
		
	return files
