extends StaticBody2D

func _ready():
	get_node("AnimatedSprite").play("idle")
	
func eat():
	get_node("AnimatedSprite").play("walking")
	yield(get_tree().create_timer(1), 'timeout')
	queue_free()
