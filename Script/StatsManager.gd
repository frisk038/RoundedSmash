extends Node

onready var xp_meter = get_parent().get_node("hud/VBoxContainer/Xp")
onready var lp_meter = get_parent().get_node("hud/VBoxContainer/Life")
onready var level = get_parent().get_node("hud/VBoxContainer/Label")


func update_life(life):
	lp_meter.value += life 
	
func _on_damage_zone_damage_given(damage):
	print(damage)
	update_life(damage)
