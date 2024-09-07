extends Node2D
class_name Room

signal room_changed(previous: String, scene: String)
signal dialogue_started(room_name: Room, object_name: String, action_name: String)

func _on_looked_at(name: String) -> void:
	print("yes")
	dialogue_started.emit(self.name, name, "LookedAt")

func _on_collected(name: String, icon: Texture) -> void:
	print("collected")

func _on_inspected(puzzle: Puzzle) -> void:
	print("inspected")

func _on_went_to(destination: String) -> void:
	print("went to")
	room_changed.emit(self, destination)
	
func _on_talked_to(name: String) -> void:
	print("talked to")
	#Dialogic.start("%s_%s_%s" % [self.name, name, "TalkedTo"])
