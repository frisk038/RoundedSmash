extends Sprite

signal spawn_bullet

onready var gun_pos = $gun_pos
onready var shoot_dir = $shoot_direction

var bullet_type = "basic"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	emit_signal("spawn_bullet",
		bullet_type,
		gun_pos.global_position,
		gun_pos.global_rotation, 
		gun_pos.global_position.direction_to(shoot_dir.global_position).normalized())
