extends Node2D

const speed = 100

func _process(delta: float) -> void:
	position += transform.x * speed * delta
	

func _on_kill_timer_timeout() -> void:
	queue_free()
