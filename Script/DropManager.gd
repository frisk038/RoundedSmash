extends Node

onready var drop = [preload("res://Components/drop/drop_xp.tscn"), 
	preload("res://Components/drop/drop_lp.tscn")]
onready var rng = RandomNumberGenerator.new()
onready var player = get_parent().get_node("player")

	
func _on_enemy_dead(pos):
	var di = rng.randi_range(0, drop.size())
	if di > drop.size()-1:
		return
		
	var instance = drop[di].instance()
	instance.player = player
	instance.position = pos
		
	match di :
		0:
			instance.value = 10
		1:
			instance.value = rng.randi_range(5, 25)

	get_tree().get_root().call_deferred("add_child", instance)
