extends Node2D
class_name RoomActor

signal looked_at(name: String)
signal talked_to(name: String)

func _on_input(event: InputEvent) -> void:
	# return if not a mouse click
	if not (event is InputEventMouseButton and event.is_pressed()):
		return

	if event.button_index == MOUSE_BUTTON_LEFT:
		looked_at.emit(self.name)
	elif event.button_index == MOUSE_BUTTON_RIGHT:
		talked_to.emit(self.name)
