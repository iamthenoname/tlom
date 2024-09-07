extends Node2D
class_name RoomEvidence

@onready var texture = $Sprite2D.texture

signal looked_at(name: String)
signal collected(name: String, icon: Texture)

func _on_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton and event.is_pressed()):
		return

	if event.button_index == MOUSE_BUTTON_LEFT:
		looked_at.emit(self.name)
	elif event.button_index == MOUSE_BUTTON_RIGHT:
		collected.emit(self.name, texture)
