extends Node

onready var xp_meter = get_parent().get_node("hud/VBoxContainer/Xp")
onready var lp_meter = get_parent().get_node("hud/VBoxContainer/Life")
onready var level = get_parent().get_node("hud/VBoxContainer/Label")


func update_life(life):
	lp_meter.value += life 
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
