extends RigidBody

export var acceleration = 30.0
export var rotation_speed = 80.0
var health_max = 300
var health = 300
var is_on_floor = true

onready var move_sound = $move

func _ready():
	pass

func move_sound():
	if (int(linear_velocity.x*10) != 0 or int(linear_velocity.y*10) !=0 or angular_velocity.y != 0) and !move_sound.is_playing():
		move_sound.play(0)
	if int(linear_velocity.x*10) == 0 and int(linear_velocity.y*10) == 0 and int(angular_velocity.y) == 0 and move_sound.is_playing():
		move_sound.stop()

func control(delta):
	
	if is_on_floor and get_parent().is_in_group('player'):
		if Input.is_action_pressed("rotate_left"):
			self.set_angular_velocity(Vector3(0,rotation_speed*delta,0))
		if Input.is_action_pressed("rotate_right"):
			self.set_angular_velocity(Vector3(0,-rotation_speed*delta,0))
		if Input.is_action_pressed("move_forward"):
			var new_x = cos(rotation.y) * acceleration
			var new_z = sin(rotation.y) * acceleration
			self.add_central_force(Vector3(-new_x,0.0,new_z))
		if Input.is_action_pressed("move_backward"):
			var new_x = cos(rotation.y) * acceleration
			var new_z = sin(rotation.y) * acceleration
			self.add_central_force(Vector3(new_x,0.0,-new_z))


func _physics_process(delta):
	
	control(delta)
	move_sound()

func _on_tank_body_entered(body):
	is_on_floor = true

func _on_tank_body_exited(body):
	is_on_floor = false


