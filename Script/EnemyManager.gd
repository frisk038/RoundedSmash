extends Node


onready var player:KinematicBody2D = get_parent().get_node("player")
onready var enemy = preload("res://Components/enemy/base_enemy.tscn")
onready var rng = RandomNumberGenerator.new()
onready var drop_mgr = get_parent().get_node("DropManager")

const max_height = 1000
const max_width = 500
const min_height = -100
const min_width = -100

# Called when the node enters the scene tree for the first time.
func new_enemy():
	var instance = enemy.instance()
	instance.player = player
	
	return instance 
	
func _ready():
	pass
	
func _on_Timer_timeout():
	var instance = new_enemy()
	var vec = Vector2.ZERO
	match rng.randi_range(0, 3):
		0:
			vec = Vector2(min_width, rng.randf_range(0, max_height))
		1:
			vec = Vector2(rng.randf_range(min_width, max_width), min_height)
		2:
			vec = Vector2(max_width, rng.randf_range(min_height, max_height))
		3:
			vec = Vector2(rng.randf_range(min_width, max_width), max_height)
	instance.global_position = vec
	instance.connect("dead", drop_mgr, "_on_enemy_dead")
	get_tree().get_root().add_child(instance)
