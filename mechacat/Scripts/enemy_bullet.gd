extends Node2D

@export var speed: int = 100
@export var offset: float = 0.0
@export var frequency: int = 0
@export var amplitude: float = 0.0
@onready var timer: Timer = $Area2D/Timer

func _process(delta: float) -> void:
	timer.start()
	offset += delta
	position += transform.x * speed * delta + transform.y * sin(offset * frequency) * amplitude



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("true")
	queue_free()
	


func _on_timer_timeout() -> void:
	print("false")
	queue_free()
