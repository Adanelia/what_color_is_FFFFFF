extends Control


var clipboard : String = ""
var regex = RegEx.new()

onready var ShowColor = $VBoxContainer/ColorPicker


func _ready():
	# Regular expression I wrote to match color
	regex.compile("^#?([0-9a-fA-F]{3,4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")


func _process(delta):
	# Only working when window is active
	if OS.is_window_focused():
		# Get clipboard
		var clipboard_current : String = OS.clipboard
		# Length must <= 9
		if clipboard_current.length() > 9 or regex.search(clipboard_current) == null:
			return
		if clipboard != clipboard_current:
			clipboard = clipboard_current
			# Set color
			ShowColor.color = Color(clipboard)

