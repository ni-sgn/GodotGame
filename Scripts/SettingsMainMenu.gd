extends Node
var slideed = false;
onready var slideAnim = $AnimationPlayer;
onready var Slida = $Panel/Node/AnimationPlayer;
func _ready():
	pass


func _on_Settings_pressed():
	slideAnim.play("SlidePanel");
	Slida.play("slididoo");
	pass # Replace with function body.


func _on_Back_pressed():
	slideAnim.play_backwards("SlidePanel");
	Slida.play_backwards("slididoo");
	pass # Replace with function body.
