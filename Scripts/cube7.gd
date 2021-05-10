extends StaticBody

var Interactible = false
var KinBody = KinematicBody
onready var DirLight = $"../DirectionalLight";

func _ready():
	pass

func _process(delta):
	if Interactible and Input.is_action_just_pressed("Interaction"):
		DirLight.queue_free()
	pass

func _on_Area_body_entered(body):
	Interactible = true
	KinBody = body
	body.InteractLabel = true
	pass # Replace with function body.


func _on_Area_body_exited(body):
	Interactible = false
	body.InteractLabel = false
	pass # Replace with function body.
