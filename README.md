# Godot Linux Shortcut Creator
 A simple script for creating desktop files and registering godot games as applications in Linux.
 
 <a target="_blank" href="https://icons8.com/icon/83740/shortcut">Shortcut</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a>
 
 This is recommended for non-Steam games that users will download onto their Linux-based computers. It is not recommended for Steam because Steam automatically creates shortcuts.

Usage:
1. Under Project Settings > Application > Config in the Godot Editor, fill in the name and description fields. These will be used automatically in the script.
2. Replace the default icon.png with your own, this will become the shortcut icon.
3. Copy the script shortcut_creator.gd into your project, or just copy its code.
4. Call the creator_shortcut function.
5. Now your game should show up in the applications menu of Linux DE's

NOTES:
If you run this script in the editor, a shortcut will be made and will be the exact same as an exported one. The only difference is that executing it will open the Godot Editor. For actual testing make sure to export your game before creating a shortcut. To prevent creating a shortcut in the editor, try this:

	if OS.has_feature("standalone"):
		create_shortcut()
