extends Node2D

func _ready():
	$Core.emitting = true
	$Smoke.emitting = true
	$Fire.emitting = true
	$ExplosionSFX.play()
	await get_tree().create_timer(2.0).timeout
	queue_free()
