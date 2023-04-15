extends Area2D

var player
var value

func get_effect():
	print("not implemented")

func _ready():
	var tween := create_tween()
	tween.tween_property(self, "position", player.position, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN_OUT)
	yield(tween, "finished")
	queue_free()
