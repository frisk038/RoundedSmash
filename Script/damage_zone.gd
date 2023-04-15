extends Area2D

signal damage_given

func _on_Timer_timeout():
	for b in get_overlapping_bodies():
		if b.is_in_group("enemy"):
			emit_signal("damage_given", b.hit_damage)
