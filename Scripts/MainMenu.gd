extends Control


func _ready():
	pass




func _on_Start_pressed():
	get_tree().change_scene("res://Levels/level1.tscn");
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit();
	pass # Replace with function body.
