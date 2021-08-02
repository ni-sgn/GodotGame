extends Area

var pickedUp = false;
var inArea = false;
onready var gan = get_parent().get_parent().get_parent()
var pos = gan.transform.origin;
var Player;
func _ready():
	pass # Replace with function body.


func _process():
	pass


func _on_Area_body_entered(body):
	inArea = true
	Player = 
	pass # Replace with function body.


func _on_Area_body_exited(body):
	pass # Replace with function body.
