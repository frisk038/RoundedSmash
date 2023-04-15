extends Node

onready var xp_meter = get_parent().get_node("hud/VBoxContainer/Xp")
onready var lp_meter = get_parent().get_node("hud/VBoxContainer/Life")
onready var lv_meter = get_parent().get_node("hud/VBoxContainer/Label")
onready var stat = {"xp" : xp_meter, "lp" : lp_meter}

var level = 1

func update_life(life):
	lp_meter.value += life 
	
func _on_damage_zone_damage_given(damage):
	update_life(damage)
	resolve_stats()
	
func _on_damage_zone_area_entered(area):
	if area.is_in_group("collectible"):
		var effect = area.call("get_effect")
		stat[effect["type"]].value += effect["value"]
		resolve_stats()
	
func resolve_stats():
	if lp_meter.value <= 0:
		print("fail")
	elif xp_meter.value >= 100:
		xp_meter.value = 0
		emit_signal("new_level")
