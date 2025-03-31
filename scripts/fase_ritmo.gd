extends Node2D

@onready var nota_scene = preload("res://scenes/Nota.tscn")
@onready var spawn_point = $SpawnArea
@onready var audio = $AudioStreamPlayer

func _ready():
	audio.play()

func _on_timer_timeout():
	var nota = nota_scene.instantiate()
	nota.position = spawn_point.global_position
	add_child(nota)


#func _on_timer_timeout() -> void:
	#pass # Replace with function body.
