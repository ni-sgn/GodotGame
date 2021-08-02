extends KinematicBody
var Accel = 15
var Gravity = -9;
var Max_Gravity = -29;
var Speed = 5;
var RUN = 1;
var Velocity = Vector3();
const UP = Vector2(0, -1);
var JumpHeight = 4.3;
var MouseSense = StoragePlayer.Sense;
var CoinCount = 0;
var Stamina = 100;
onready var StaminaBar = $Stamina;
var InteractLabel = false;
onready var PlayerCamera = $Camera;
var Running = false;
var StaminaGen = 0.07;
var jumpin = false;
var jumpabl = false;
export (int, 0, 200) var push = 100
#onready var Menu = $Control;
#var MenuShow = false;
signal Interact(value)


var SHOOT_RAY = false;
var EventData;
var from;
var to;

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	$Label.hide();
	pass

	
func _input(event):
	if event is InputEventMouseMotion:
		var MouseMovement = event.relative;
		PlayerCamera.rotation.x += -deg2rad(MouseMovement.y * MouseSense);
		PlayerCamera.rotation.x = clamp(PlayerCamera.rotation.x, -deg2rad(90), -deg2rad(-90));
		rotation.y += -deg2rad(MouseMovement.x * MouseSense);

	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		SHOOT_RAY = true;
		EventData = event;
		from = PlayerCamera.project_ray_origin(event.position);
		to = from + PlayerCamera.project_ray_normal(event.position) * 1000;
	pass
	  
func _physics_process(delta):
	#update thangs
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit();
	if !Running:
		Stamina += StaminaGen;
	StaminaBar.value = Stamina;
	#Testing ray casting
	if SHOOT_RAY:
		
		var result = get_world().direct_space_state.intersect_ray(from, to, [self]);
		print(result)
		SHOOT_RAY = false
		DrawLine.DrawLine(from,to, Color(100,100,100),10);
	#Movement and Camera
	var Dir = Vector2();
	if Input.is_action_pressed("s"):
		Dir.y += 1;
	if Input.is_action_pressed("w"):
		Dir.y -= 1;
	if Input.is_action_pressed("d"):
		Dir.x += 1;
	if Input.is_action_pressed("a"):
		Dir.x -= 1;
	#RAAAAN
	if Input.is_action_pressed("shift"):
		Running = true;
		Stamina -= 0.16;
		if Stamina >= 1:
			RUN = 1.80;
		else:
			RUN = 1;
	else:
		RUN = 1;
		Running = false;
	
	Velocity.y += Gravity * delta;
	
	if Velocity.y < Max_Gravity:
		Velocity.y = Max_Gravity; 
		
	#JUMP
	if is_on_floor() and Input.is_action_pressed("Jump"):
		Velocity.y = JumpHeight;


	Dir = Dir.normalized().rotated(-rotation.y);
	Velocity.x = lerp(Velocity.x, Dir.x * Speed * RUN, Accel * delta);
	Velocity.z = lerp(Velocity.z, Dir.y * Speed * RUN, Accel * delta);
	Velocity = move_and_slide(Velocity, Vector3(0,1,0), false, 4, 0.783598, false);
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * push)
	Stamina = clamp(Stamina,0,100);
	pass
	
func _on_Quit_pressed():
	get_tree().quit();
	print("bro")
	pass # Replace with function body.

