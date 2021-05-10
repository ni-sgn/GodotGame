extends Control


func _ready():
	pass


func _on_Start_button_down():
	get_tree().change_scene("res://Levels/level1.tscn");
	pass # Replace with function body.


func _on_Quit_button_down():
	get_tree().quit();
	pass # Replace with function body.
