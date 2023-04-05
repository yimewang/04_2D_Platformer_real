extends Node


func _ready():
	if $Attack.is_colliding():
		var target = $Attack.get_collider()
		if target.has_method("damage"):
			target.damage()
			
	if $Attack2.is_colliding():
		var target = $Attack2.get_collider()
		if target.has_method("damage"):
			target.damage()
