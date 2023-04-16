extends Node

onready var enemy_mgr = $EnemyManager
onready var shoot_mgr = $ShootingManager
onready var stat_mgr = $StatsManager
onready var input_mgr = $InputManager
onready var drop_mgr = $DropManager
onready var damage_zone = $damage_zone
onready var gun = $player/gun

func _ready():
	enemy_mgr.drop_mgr = drop_mgr
	gun.connect("spawn_bullet", shoot_mgr, "on_spawn_bullet")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
