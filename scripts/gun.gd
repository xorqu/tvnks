extends KinematicBody


export var rotation_speed = 50.0
var damage = 150
var recoil = 200
var reloading_time = 1
var is_reloaded = true
var reloading_progress = 1

onready var gun_rotate_sound = $gun_rotate


func _ready():
	pass


func control(delta):
	#управление и звук
	if get_parent().get_parent().is_in_group('player'):
		if Input.is_action_pressed("gun_rotate_left"):
			self.rotation_degrees.y += rotation_speed * delta
			if !gun_rotate_sound.is_playing():
				gun_rotate_sound.play(0)
		elif Input.is_action_pressed("gun_rotate_right"):
			self.rotation_degrees.y -= rotation_speed * delta
			if !gun_rotate_sound.is_playing():
				gun_rotate_sound.play(0)
		else:
			if gun_rotate_sound.is_playing():
				gun_rotate_sound.stop()
			
func _physics_process(delta):
	control(delta)
	

