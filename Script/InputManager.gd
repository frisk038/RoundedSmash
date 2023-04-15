extends Node2D

export(float, 0, 1, 0.01) var radius : float = 0.2

onready var joystick = get_parent().get_node("control/HBoxContainer/Virtual joystick")
onready var initial_position = get_viewport_rect().size / 2
onready var player = get_parent().get_node("player")


var pressed = false
var velocity = Vector2.ZERO
var speed = 200

func _physics_process(_delta):
	velocity = Vector2( Input.get_axis("ui_left", "ui_right"),
		Input.get_axis( "ui_up","ui_down")).normalized() * speed

	if joystick.is_pressed() :
		pressed = true
		player.rotation = joystick.get_output().angle()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

