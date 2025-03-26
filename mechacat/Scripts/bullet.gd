extends Area2D

var speed = 400
@onready var player_bullet: Area2D = $"."

func _physics_process(delta):
	position += transform.x * speed * delta
	
#func _on_Bullet_body_entered(body):
	#print("Heavy hits bb")
	#queue_free()

	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()




func _on_body_entered(body: Node2D) -> void:
	queue_free()
	



func _on_area_entered(area: Area2D) -> void:
	if area != player_bullet:
		queue_free()
	else:
		pass
