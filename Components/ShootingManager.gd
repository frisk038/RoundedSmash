extends Node


export (float) var fire_rate = 1.0

onready var bullet = preload("res://Components/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	pass

func _on_Player_spawn_bullet(pos:Vector2, rot:float, dir:Vector2):
	var instance = bullet.instance()
	instance.global_position = pos
	instance.rotation = rot
	instance.direction = dir
	self.add_child(instance)
