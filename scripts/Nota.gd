extends Area2D

@export var speed: float = 200.0

func _process(delta):
	position.y += speed * delta
	if position.y > 600:
		queue_free()  # Apaga a nota se sair da tela
