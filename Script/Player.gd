extends KinematicBody2D

signal spawn_bullet(pos)

onready var joystick = get_parent().get_node("control/HBoxContainer/Virtual joystick")
onready var initial_position = get_viewport_rect().size / 2

export(float, 0, 1, 0.01) var radius : float = 0.2
export (int) var life = 10

var speed = 200  # speed in pixels/sec
var velocity = Vector2.ZERO
var pressed = false

func set_input():
	velocity = Vector2( Input.get_axis("ui_left", "ui_right"),
		Input.get_axis( "ui_up","ui_down")).normalized() * speed

	if joystick.is_pressed() :
		pressed = true
		rotation = joystick.get_output().angle()

func _physics_process(_delta):
	set_input()
#	if velocity != Vector2.ZERO:
#		position = (velocity * radius) + initial_position

func _ready():
	position = get_viewport_rect().size / 2

func _on_Timer_timeout():
	emit_signal("spawn_bullet", 
		$gun.global_position, 
		rotation, 
		$gun.global_position.direction_to($gun_ahead.global_position).normalized())
