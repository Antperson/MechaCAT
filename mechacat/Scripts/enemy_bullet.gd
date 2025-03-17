extends Node2D

const speed = 100

func _process(delta: float) -> void:
	position += transform.x * speed * delta



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("true")
	queue_free()
	


func _on_timer_timeout() -> void:
	print("false")
	queue_free()
