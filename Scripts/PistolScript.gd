extends RigidBody

var PickingUp = true;
var Inside = false;
var player;
var x = preload("res://Prefabs/Pistol.tscn")
var from;
var to;
func _ready():
	get_node("Interactive/Area").connect("SignalToParent" , self ,  "On_Signal_Interactive" );
	pass # Replace with function body.


func _process(delta):
	if Inside and PickingUp and Input.is_action_just_pressed("Interaction"):
		PickingUp = false
		
		var i = x.instance()
		player.get_node("Camera").add_child(i);
		queue_free()
	pass
func On_Signal_Interactive(switch, playerbody):
	Inside = switch;
	player = playerbody;
	pass
