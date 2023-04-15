extends Node

export (int) var speed = 300

onready var player = $"Player"
onready var sprite = $"Player/Sprite"

var screen_size = Vector2(100, 100)
var sprite_x 
var sprite_y 

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_x = sprite.texture.get_width()/ 2.0 
	sprite_y = sprite.texture.get_height() / 2.0


func _physics_process(delta: float) -> void:
	var movement_direction := Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		movement_direction.y = -1
	if Input.is_action_pressed("ui_down"):
		movement_direction.y = 1
	if Input.is_action_pressed("ui_left"):
		movement_direction.x = -1
	if Input.is_action_pressed("ui_right"):
		movement_direction.x = 1

	movement_direction = movement_direction.normalized()
	player.move_and_slide_with_snap()
	player.move_and_slide(movement_direction * speed)
	
	player.position = player.position.limit_length(100)
	player.look_at(movement_direction)
