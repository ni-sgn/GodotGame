extends Camera

var loc = Vector3();

func _ready():
	pass # Replace with function body.
func _process(delta):
	var fps = Engine.get_frames_per_second()
	var lerp_interval = loc / fps
	var stuipid = global_transform.origin + lerp_interval;
	
	if fps > 60:
		self.set_as_toplevel(true)
		self.global_transform.origin = self.global_transform.origin.linear_interpolate(stuipid, 40 * delta);
	else:
		self.global_transform = global_transform;
		self.set_as_toplevel(false)
	pass
 
func _physics_process(delta):
	
	pass
