extends Node2D

@export var speed: int = 100
@export var offset: float = 0.0
@export var frequency: int = 0
@export var amplitude: float = 1.5

const exp = preload("res://Scenes/Explosion.tscn")
var count = 0

func _process(delta: float) -> void:
	var ran = randi_range(-1,1)
	count+=1
	offset+=delta
	if count % 50 == 0 and ran != 0:
		amplitude*= ran
	position += transform.x * speed * delta + transform.y * sin(offset * frequency) * amplitude



func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
