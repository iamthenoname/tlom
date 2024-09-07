extends Node
class_name Episode

@export_file var starting_room = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var room = load(starting_room)
	var scene = room.instantiate()
	add_child(scene)
	scene.dialogue_started.connect(_on_dialogue_started)
	scene.room_changed.connect(_on_room_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dialogue_started(room_name: String, object_name: String, action_name: String) -> void:
	print("%s_%s_%s_%s" % [self.name, room_name, object_name, action_name])
	Dialogic.start("%s_%s_%s_%s" % [self.name, room_name, object_name, action_name])

func _on_room_changed(previous: Room, scene: String) -> void:
	previous.queue_free()
	
	var next = load(scene)
	var instance = next.instantiate()
	add_child(instance)
	instance.dialogue_started.connect(_on_dialogue_started)
	instance.room_changed.connect(_on_room_changed)
