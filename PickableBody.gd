extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Interactive/Area").connect("SignalToParent", self, "_on_interact_signal")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	pass

func _on_interact_signal(switch, PlayerBody):
	print(PlayerBody.name);

	pass
