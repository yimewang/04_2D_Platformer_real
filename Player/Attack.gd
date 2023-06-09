extends Node

onready var SM = get_parent()
onready var player = get_node("../..")
onready var enemy = get_node("../..")

func _ready():
	yield(player, "ready")
	
	if $Attack.is_colliding():
		var target = $Attack.get_collider()
		if target.has_method("damage"):
			target.damage()
			
	if $Attack2.is_colliding():
		var target = $Attack2.get_collider()
		if target.has_method("damage"):
			target.damage()


func start():
	player.set_animation("Attacking")
	player.get_node("AnimatedSprite").offset.y = 7
	$Timer.start()

func end():
	player.get_node("AnimatedSprite").offset.y = 0
	

func physics_process(_delta):
	pass


func _on_Timer_timeout():
	if SM.state_name == "Attacking":
		player.attack()

