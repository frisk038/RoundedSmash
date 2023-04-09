extends KinematicBody2D

signal dead
signal damage_given

export (int) var life = 10
export (float) var speed =  50.0
export (float) var max_distance =  50.0
export (int) var hit_damage =  1

onready var timer = $Timer

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
		else:
			if timer.is_stopped():
				timer.start()
			

func handle_hit(damage:int):
	life -= damage
	life = clamp(life, 0, 10)
	if life == 0 :
		visible = false
		position = reset_position
		emit_signal("dead")
		player = null
		timer.stop()
	#play damaged or death


func _on_Timer_timeout():
	emit_signal("damage_given", hit_damage)
