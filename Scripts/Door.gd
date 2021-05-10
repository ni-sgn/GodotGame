extends Spatial

var InternalState = false

func _ready():
	get_node("Hinge/Interactive/Area").connect("SignalToParent", self, "_on_Interact");
	pass



func _on_Interact(switch):
	if(switch): 
		if InternalState == false:
			InternalState = true;
		else:
			InternalState = false
		
	if (InternalState):
		get_node("Hinge").rotation.y = deg2rad(90);
		print("opened")
	else:
		get_node("Hinge").rotation.y = -deg2rad(0);
		print("closed")
	
	pass
