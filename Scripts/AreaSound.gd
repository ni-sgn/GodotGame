extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# you should change  sounds inside the player

#let's put the same sound here, I don't want to hear no 
#bell ringing anymore, it's a torture
var Sound1 = preload("res://Sounds/little-birds-singing-in-the-trees-17.wav");
var Sound2 = preload("res://Sounds/little-birds-singing-in-the-trees-17.wav");
var SoundList = [Sound1, Sound2]
var RandomSound = round(rand_range(0,1));
var CurrentSound = RandomSound;
var isInside = false;
var Player = KinematicBody;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	if isInside and !$Sound1.playing:
		RandomSound = round(rand_range(0,1));
		$Sound1.stream = SoundList[RandomSound];
		$Sound1.play()

func _on_Area_body_entered(body):
	if body.name == "PlayerBody":
		Player = body;
		isInside = true;
	pass # Replace with function body.


func _on_Area_body_exited(body):
	if body.name == "PlayerBody":
		Player = body;
		isInside = false;
	pass # Replace with function body.


func _on_Sound1_finished():
	$Sound1.stop()
	pass # Replace with function body.

