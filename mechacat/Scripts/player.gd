extends CharacterBody2D

const SPEED = 300.0
var isSlashing = false
var isShooting = false

const bullet = preload("res://Scenes/bullet.tscn")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
		
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
func _process(delta):
	"""if (velocity == Vector2.ZERO):
		$AnimatedSprite2D.play("Idle")
	elif Input.is_action_just_pressed("slash") && isShooting == false:
		isSlashing == true
		$AnimatedSprite2D.play("Slash")
	el"""
	if Input.is_action_just_pressed("shoot")&& isSlashing == false:
		shoot()
		isShooting == true
		$AnimatedSprite2D.play("Shoot")
		
func on_AnimatedSprite_animation_finished():
	if $AnimatedSprite2D.animation == "Slash":
		isSlashing == false
	if $AnimatedSprite2D.animation == "Shoot":
		isShooting == false
		
func shoot():
	var b = bullet.instantiate()
	b.position = $Rotator.position
	get_parent().add_child(b)
	b.position = $Rotator.global_position
	b.rotation = $Rotator.global_rotation
