extends Area2D

export (int) var speed =  10
export (int) var damage =  5
var direction:Vector2

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if direction != Vector2.ZERO:
		var velo = direction * speed
		global_position += velo


func _on_bullet_body_entered(body:Node):
	if body.has_method('handle_hit'):
		body.handle_hit(damage)
	queue_free()
