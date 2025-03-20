extends Area2D

var speed = 150

func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_Bullet_body_entered(body):
	queue_free()
	
func _on_VisibilityNotifier2D_screen_exited():
	# free Bullet
	queue_free()


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
