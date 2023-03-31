extends Camera2D

var player = null


func _process(_delta):
	player = get_node_or_null("/root/Game/Player_Container/Player")
	if player != null:
		position = player.position

func _physics_process(_delta):
	var vtrans = get_canvas_transform()
	var top_left = -vtrans.get_origin() / vtrans.get_scale()
	$Fade.rect_global_position = top_left
