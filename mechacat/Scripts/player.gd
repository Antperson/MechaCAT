extends CharacterBody2D

const SPEED = 300.0
var isSlashing = false
var isShooting = false
var hp = 3
@onready var death_timer: Timer = $death_timer

const bullet = preload("res://Scenes/bullet.tscn")
const exp = preload("res://Scenes/Explosion.tscn")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
		
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
func _process(delta):
	if Input.is_action_just_pressed("slash") && isShooting == false:
		isSlashing == true
		$AnimatedSprite2D.play("Slash")
	if Input.is_action_just_pressed("shoot")&& isSlashing == false:
		shoot()
		isShooting == true
		$AnimatedSprite2D.play("Shoot")
		
func shoot():
	var b = bullet.instantiate()
	b.position = $Rotator.position
	get_parent().add_child(b)
	b.position = $Rotator.global_position
	b.rotation = $Rotator.global_rotation
	$ShootSFX.play()

func dmg_taken():
	hp -= 1
	if hp <= 0:
		print("Tragic")
		death_timer.start()
		
func _on_death_timer_timeout() -> void:
	get_tree().reload_current_scene()
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	dmg_taken()
	var e = exp.instantiate()
	e.position = position
	e.position = global_position
	e.rotation = global_rotation
	get_parent().add_child(e)


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "Slash":
		isSlashing == false
		$AnimatedSprite2D.play("Idle")
	if $AnimatedSprite2D.animation == "Shoot":
		isShooting == false
		$AnimatedSprite2D.play("Idle")
