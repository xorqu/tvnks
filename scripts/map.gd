extends Spatial


#ето чтобы камера двигалась нормально
func _ready():
	$camera.upd_target($player.get_child(0).get_child(0).get_child(0))

func _process(delta):
	if $player.get_child(0).translation.y <= -10:
		get_tree().reload_current_scene()
