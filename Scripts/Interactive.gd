extends Area

#onready var Parent = self.get_parent().get_parent();
var isBodyInside = false
var Player = KinematicBody
signal SignalToParent(switch, PlayerBody);

func _ready():
	pass

func _input(event):
	if Input.is_action_just_pressed("Interaction"): 
		emit_signal("SignalToParent", isBodyInside, Player)

func _on_Area_body_entered(body):
	
	if (body.name == "PlayerBody"):
		body.get_node("Label").show()
		isBodyInside = true;
		Player = body
	
	pass # Replace with function body.


func _on_Area_body_exited(body):
	if (body.name == "PlayerBody"):
		body.get_node("Label").hide()
		isBodyInside = false;
	pass # Replace with function body.

	
