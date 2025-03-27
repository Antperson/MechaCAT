extends Node2D

var current_wave: int = 0
@export var fish_scene:PackedScene
@export var Seagull_base:PackedScene

var starting_nodes: int
var current_nodes: int
var wave_spawn_ended


func _ready() -> void:
	current_wave = 0
	Global.current_wave = current_wave
	starting_nodes = get_child_count()
	current_nodes = get_child_count()
	position_to_next_wave()
	
func position_to_next_wave():
	if current_nodes == starting_nodes:
		if current_wave != 0:
			Global.moving_to_next_wave = true
		wave_spawn_ended = false
		current_wave += 1
		Global.current_wave = current_wave
		prepare_spawn("fish", 1.0, 1.0) #type, multiplier, spawns
		prepare_spawn("birds", 4.0, 2.0)
		print(current_wave)

func prepare_spawn(type, multiplier, mob_spawns):
	var mob_amount = float(current_wave) * multiplier
	var mob_wait_time: float = 2.0
	#print("mob_amount: ", mob_amount)
	var mob_spawn_rounds = mob_amount/mob_spawns
	spawn_type(type, mob_spawn_rounds, mob_wait_time)

func spawn_type(type, mob_spawn_rounds, mob_wait_time):
	if type == "fish":
		var fish_spawn1 = $FishSpawn1
		var fish_spawn2 = $FishSpawn2
		if mob_spawn_rounds >= 1:
			var fish1 = fish_scene.instantiate()
			fish1.global_position = fish_spawn1.global_position
			var fish2 = fish_scene.instantiate()
			fish2.global_position = fish_spawn2.global_position
			add_child(fish1)
			add_child(fish2)
			mob_spawn_rounds -= 1
			await get_tree().create_timer(mob_wait_time).timeout
		"""elif type == "birds":
			var bird_spawn1 = $SeagullSpawn1
			var bird_spawn2 = $SeagullSpawn2
			for i in mob_spawn_rounds:
				var bird1 = Seagull_base.instantiate()
				bird1.global_position = bird_spawn1.global_position
				var bird2 = Seagull_base.instantiate()
				bird2.global_position = bird_spawn2.global_position
				add_child(bird1)
				add_child(bird2)
				mob_spawn_rounds -= 1
				await get_tree().create_timer(mob_wait_time).timeout"""
		wave_spawn_ended = true
		
func _process(delta: float) -> void:
	current_nodes = get_child_count()
	if wave_spawn_ended:
		position_to_next_wave()
