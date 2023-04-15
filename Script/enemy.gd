extends KinematicBody2D

signal dead

export (int) var life = 10
export (float) var speed =  50.0
export (float) var max_distance =  50.0
export (int) var hit_damage =  -1

var player:Node2D = null
var reset_position = Vector2(-1000, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if player != null:
		var target = (player.position - position).normalized()
		if position.distance_to(player.position) > max_distance:
			move_and_slide(target * speed)
			look_at(player.position)

func handle_hit(damage:int):
	life -= damage
	life = clamp(life, 0, 10)
	if life == 0 :
		visible = false
		position = reset_position
		emit_signal("dead")
		player = null
	#play damaged or death
