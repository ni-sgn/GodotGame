extends Area

onready var AnimPlayer = $AnimationPlayer;
onready var AudioPlayer = $AudioStreamPlayer;
var KinBod = KinematicBody;
func _ready():
	pass

func _process(delta):
	self.rotation.y += deg2rad(45) * delta;
	pass


func _on_Area_body_entered(body):
	AnimPlayer.play("coin_grab");
	KinBod = body;
	#doesn't work yet
	#AudioPlayer.play(1.1)
	pass # Replace with function body.

func Anim_End():
	KinBod.CoinCount +=1;
	self.queue_free();

func Anim_Start():
	$AudioStreamPlayer.play(self.transform.origin.x);
