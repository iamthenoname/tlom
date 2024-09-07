extends Node2D
class_name RoomEntity

signal looked_at(name: String)

func _on_input(event: InputEvent) -> void:
	# return if not a mouse click
	if not (event is InputEventMouseButton and event.is_pressed()):
		return

	if event.button_index == MOUSE_BUTTON_LEFT:
		looked_at.emit(self.name)


func _on__input(event: InputEvent) -> void:
	pass # Replace with function body.


func _on_control_gui_input(event: InputEvent) -> void:
	pass # Replace with function body.
