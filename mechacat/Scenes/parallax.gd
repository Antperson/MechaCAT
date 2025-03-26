extends ParallaxLayer
@export var speed = -15

func _process(delta: float) -> void:
	self.motion_offset.x += speed * delta
