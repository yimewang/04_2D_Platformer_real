extends Area2D

var score = 10
var Global = get_node_or_null("res://Global.gd")

func _on_Coin_body_entered(body):
	if body.name == "Player":
		Global.update_score(score)
		queue_free()
