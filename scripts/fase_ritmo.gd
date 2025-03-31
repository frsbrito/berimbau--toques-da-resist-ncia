extends Node2D

@onready var audio = $AudioStreamPlayer
@onready var spawn_point = $SpawnArea
@onready var timer = $Timer

@onready var nota_grave_scene = preload("res://scenes/NotaGrave.tscn")
@onready var nota_media_scene = preload("res://scenes/NotaMedia.tscn")
@onready var nota_aguda_scene = preload("res://scenes/NotaAguda.tscn")

var posicoes_x = {
	"grave": 300,
	"media": 600,
	"aguda": 900
}

func _ready():
	audio.play()
	timer.start()

func _on_timer_timeout():
	# Escolhe aleatoriamente uma das 3 notas
	var tipo = ["grave", "media", "aguda"].pick_random()
	var nota

	match tipo:
		"grave":
			nota = nota_grave_scene.instantiate()
		"media":
			nota = nota_media_scene.instantiate()
		"aguda":
			nota = nota_aguda_scene.instantiate()

	nota.position = Vector2(posicoes_x[tipo], spawn_point.global_position.y)
	add_child(nota)
