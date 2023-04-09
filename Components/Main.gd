extends Node

onready var enemy_mgr = $EnemyManager
onready var shoot_mgr = $ShootingManager
onready var stat_mgr = $StatsManager

func _ready():
	enemy_mgr.connect("inflict_damage", stat_mgr, "update_life")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
