extends InterpolatedCamera

#и ето чтобы камера двигалась нормально
func _ready():
	camera_movement.camera = self

func upd_target(t):
	target = get_path_to(t)
	
