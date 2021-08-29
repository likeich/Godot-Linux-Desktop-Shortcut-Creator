extends Node



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_shortcut()

func create_shortcut() -> void:
	# Get username
	var output := []
	var _error = OS.execute("whoami", [], true, output)
	var username: String = output[0].substr(0, output[0].length() - 1) # Trim junk
	
	# Get other useful data.
	var project_name: String = ProjectSettings.get_setting("application/config/name")
	var description: String = ProjectSettings.get_setting("application/config/description")
	
	# Prepare paths.
	var user_folder_path := "/home/" + username + "/.local/share/godot/app_userdata/" + project_name + "/"
	var desktop_file_path := user_folder_path + project_name + ".desktop"
	var exec_path := OS.get_executable_path().split(username + "/")[1]
	
	# Save game icon to storage.
	var icon: Texture = load("res://icon.png")
	var icon_data := icon.get_data()
	_error = icon_data.save_png("user://shortcut.png")
	
	# Write out file with all the necessary info.
	var file := File.new()
	_error = file.open(desktop_file_path, File.WRITE)
	file.store_string("[Desktop Entry]\n")
	file.store_string("Encoding=UTF-8\n")
	file.store_string("Name=" + project_name + "\n")
	file.store_string("Comment=" + description + "\n")
	file.store_string("Exec=\"" + exec_path + "\"\n")
	file.store_string("Icon=" + user_folder_path + "shortcut.png\n")
	file.store_string("Terminal=false\n")
	file.store_string("Type=Application\n")
	file.store_string("Categories=Game;")
	file.close()
	
	_error = OS.execute("cp", [desktop_file_path, "/home/" + username + "/.local/share/applications"], true, output)
	_error = OS.execute("cp", [desktop_file_path, "/usr/share/applications"], true, output)
	
	_error = OS.execute("chmod", ["+x", desktop_file_path], true, output)
