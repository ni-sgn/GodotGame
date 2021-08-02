extends Spatial
var ViewmodelX = StoragePlayer.Vx;
var ViewmodelY = StoragePlayer.Vy;
onready var Anim = $AnimationPlayer;
var Droping = true
onready var Flashlight = $SpotLight
var FlashlightBool = false;
var ads = false;
onready var mesh = $untitled
var Bullets = 7;
var AtF = true;
onready var delay = $Timer;
var delayShoot = true;
onready var sound = $untitled/gunshot;
# 0.172 0 -0.473
func _ready():
	
	pass

func _process(delta):
	#ifs
	if Input.is_action_just_pressed("reload"):
		AtF = false
		Anim.play("Reload")
		Bullets = 7;
	if Bullets <= 0:
		AtF = false;
		Anim.play("Reload");
		Bullets = 7;
	if Input.is_action_just_pressed("mouse1"):
		if AtF:
			if delayShoot:
				delay.start();
				print("shoot");
				print(Bullets);
				delayShoot = false;
				Bullets -= 1;
				Anim.play("Fire");
				$untitled/gunshot.play()
	if Input.is_action_just_pressed("mouse2"):
		if ads:
			ads = false 
		else:
			ads = true;
		pass
	if Input.is_action_just_pressed("Flashlight"):
		print(FlashlightBool);
		if FlashlightBool:
			FlashlightBool = false
		else:
			FlashlightBool = true;
	#runsz
	if ads:
		mesh.transform.origin = Vector3(0,-0.075,-0.3);
	else:
			mesh.transform.origin.y = ViewmodelY;
			mesh.transform.origin.x = ViewmodelX;
	Flashlight.visible = FlashlightBool;
	pass
	
func DoneReload():
	AtF = true;
	pass


func _on_Timer_timeout():
	delay.stop();
	delay.wait_time = 0.4;
	delayShoot = true;
	pass # Replace with function body.
