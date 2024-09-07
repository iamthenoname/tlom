extends Node2D
class_name RoomDoor

@export_file var destination = ""

signal looked_at(name: String)
signal went_to(previous: String, destination: String)

func _on_input(event: InputEvent) -> void:
	# return if not a mouse click
	if not (event is InputEventMouseButton and event.is_pressed()):
		return

	if event.button_index == MOUSE_BUTTON_LEFT:
		looked_at.emit(self.name)
	elif event.button_index == MOUSE_BUTTON_RIGHT:
		went_to.emit(destination)
