extends Node2D

@export var speed: int = 100
@export var offset: float = 0.0
@export var frequency: int = 0
@export var amplitude: float = 0.0

const exp = preload("res://Scenes/Explosion.tscn")

func _process(delta: float) -> void:
	offset += delta
	position += transform.x * speed * delta + transform.y * sin(offset * frequency) * amplitude



func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
