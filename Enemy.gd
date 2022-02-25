extends Area2D

var speed
var move

func _ready():
	move = Vector2()
	speed = 200
	
	randomize()
	var direction = rand_range(-1, 1)
	if direction > 0:
		move.x = 1
	else:
		move.y = 1
		
func _process(delta):
	if (move.y > 0 and get_node("down").is_colliding()):
		move.y *= -1
	elif (move.y < 0 and get_node("up").is_colliding()):
		move.y *= -1
	elif (move.x > 0 and get_node("right").is_colliding()):
		move.x *= -1
	elif (move.x < 0 and get_node("left").is_colliding()):
		move.x *= -1
	move.normalized()
	position += move * speed * delta
	
	if (move.x < 0):
		get_node("AnimatedSprite").play("walking")
		get_node("AnimatedSprite").flip_h = false
	elif (move.x > 0):
		get_node("AnimatedSprite").play("walking")
		get_node("AnimatedSprite").flip_h = true
	elif (move.y < 0):
		get_node("AnimatedSprite").play("walking")
	elif (move.y > 0):
		get_node("AnimatedSprite").play("walking")

