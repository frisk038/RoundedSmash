extends Area2D

export (int) var speed =  10
var direction:Vector2

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velo = direction * speed
		global_position += velo
