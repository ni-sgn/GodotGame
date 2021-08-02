extends Node

onready var senseSlide = $Sensetivity;
onready var modelXslider = $ViewmodelX;
onready var modelYslider = $ViewmodelY;

onready var LableSenseSlider = $SensShower;
onready var LableModelX = $ViewModelXShower;
onready var LableModelY = $ViewModelYShower;

onready var push = StoragePlayer;

#vars
onready var Sense = 0.11;
onready var ViewmodelX = 0.2;
onready var ViewmodelY = -0.4;
func _ready():
	push.Sense = Sense;
	push.Vy = ViewmodelY;
	push.Vx = ViewmodelX;
	pass

func _process(delta):
	LableSenseSlider.text = String(senseSlide.value);
	LableModelX.text = String(modelXslider.value);
	LableModelY.text = String(modelYslider.value);

	pass
func _on_Sensetivity_value_changed(value):
	Sense = senseSlide.value;
	push.Sense = Sense;
	print("no");
	print(push.Sense);
	pass # Replace with function body.


func _on_ViewmodelX_value_changed(value):
	ViewmodelX = modelXslider.value;
	push.Vx = ViewmodelX;
	print("yo")
	print(push.Vx);
	pass # Replace with function body.


func _on_ViewmodelY_value_changed(value):
	ViewmodelY = modelYslider.value;
	push.Vy = ViewmodelY;
	print("bro");
	print(push.Vy);
	pass # Replace with function body.
