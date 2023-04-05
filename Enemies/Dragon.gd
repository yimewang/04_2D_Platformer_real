extends KinematicBody2D

onready var SM = $StateMachine


var velocity = Vector2.ZERO
var direction = 1
var walking = 0.0

func _ready():
	SM.set_state("Idle")

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func damage():
	print("damage")
	if SM.state_name != "Die":
		SM.set_state("Die")


func should_attack():
	if $Attack.is_colliding() and $Attack.get_collider().name == "Player":
		return true
	return false

func attack_target():
	if $Attack.is_colliding():
		return $Attack.get_collider()
	return null

func _on_AnimatedSprite_animation_finished():
	if SM.state_name == "Attack":
		SM.set_state("Idle")
	if SM.state_name == "Die":
		queue_free()



func _on_Detect_body_entered(_body):
	if SM.state_name != "Attack":
		SM.set_state("Attack")
