extends Node2D
class_name RoomPuzzle

@export_file var puzzle_scene = ""

signal looked_at(name: String)
signal inspected(puzzle: Puzzle)

func _on_input(event: InputEvent) -> void:
	# return if not a mouse click
	if not (event is InputEventMouseButton and event.is_pressed()):
		return

	if event.button_index == MOUSE_BUTTON_LEFT:
		looked_at.emit(self.name)
	elif event.button_index == MOUSE_BUTTON_RIGHT:
		inspected.emit(puzzle_scene)
