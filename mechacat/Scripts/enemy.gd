extends Node2D

const bullet_scene = preload("res://Scenes/enemy_bullet.tscn")
@onready var shoot_timer: Timer = $ShootTimer
@onready var rotator: Node2D = $Rotator


const rotate_speed = 0
const shoot_timer_wait_time = 1
const spawn_point_count = 1
const radius = 50
var hp = 5

func _ready() -> void:
	var step = 2 * PI / spawn_point_count
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(-radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotator.add_child(spawn_point)
		
	shoot_timer.wait_time = shoot_timer_wait_time
	shoot_timer.start()
	$AnimatedSprite2D.play("attack")

func _process(delta: float) -> void:
	var new_rotation = rotator.rotation_degrees + rotate_speed * delta
	rotator.rotation_degrees = fmod(new_rotation, 360)

func _on_shoot_timer_timeout() -> void:
	for s in rotator.get_children():
		var bullet = bullet_scene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation

func taking_dmg():
	hp -= 1
	if hp<0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(true)


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	taking_dmg()
