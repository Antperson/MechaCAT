extends CharacterBody2D

const SPEED = 300.0
var isSlashing = false
var isShooting = false

const Bullet = preload("res://Scenes/bullet.tscn")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
		
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
func _process(delta):
	if (velocity != Vector2.ZERO):
		$AnimatedSprite2D.play("Idle")
			
	if Input.is_action_just_pressed("slash") && isShooting == false:
		$AnimatedSprite2D.play("Slash")
		isSlashing == true
		
	if Input.is_action_just_pressed("shoot")&& isSlashing == false:
		var b = Bullet.instance()
		owner.add_child(b)
		b.transform = $Gun.global_transform
		$AnimatedSprite2D.play("Shoot")
		isShooting == true
		
func on_AnimatedSprite_animation_finished():
	if $AnimatedSprite2D.animation == "Slash":
		isSlashing == false
	if $AnimatedSprite2D.animation == "Shoot":
		isShooting == false
