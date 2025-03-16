extends CharacterBody2D

const SPEED = 300.0
var isSlashing = false
var isShooting = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
		
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
func _process(delta):
	if (velocity == Vector2.ZERO):
		$AnimatedSprite2D.play("Idle")
	elif Input.is_action_just_pressed("slash") && isShooting == false:
		isSlashing == true
		$AnimatedSprite2D.play("Slash")
	elif Input.is_action_just_pressed("shoot")&& isSlashing == false:
		isShooting == true
		$AnimatedSprite2D.play("Shoot")
		
func on_AnimatedSprite_animation_finished():
	if $AnimatedSprite2D.animation == "Slash":
		isSlashing == false
	if $AnimatedSprite2D.animation == "Shoot":
		isShooting == false
	
