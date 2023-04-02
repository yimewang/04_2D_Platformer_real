extends Node

onready var SM = get_parent()
onready var enemy = get_node("../..")
var c = 0

func _ready():
	yield(enemy, "ready")

func start():
	enemy.velocity = Vector2.ZERO
	enemy.set_animation("Hurt")
	c += 1
	print(c)
	if c >= 3:
		SM.set_state("Die")

