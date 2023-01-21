extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$camera.upd_target($player.get_child(0).get_child(0).get_child(0))

func _process(delta):
	if $player.get_child(0).translation.y <= -10:
		get_tree().reload_current_scene()
