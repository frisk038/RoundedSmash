extends ColorRect


func _ready():
	pass


func _on_TextureButton_pressed():
	var err = get_tree().change_scene("res://main.tscn")
	if err != OK :
		print("cant load game scene")
