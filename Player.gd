extends Area2D

var speed
var move
var carrots
var horseFood

func _ready():
	speed = 200
	move = Vector2()
	carrots = 0
	horseFood = 0
	
func _process(delta):
	move = Vector2()
	get_tree().get_root().get_node("Game/UI/Collect").text = str(get_tree().get_root().get_node("Game").score)
	get_tree().get_root().get_node("Game/UI/Carrot").text = str(carrots)
	get_tree().get_root().get_node("Game/UI/HorseFood").text = str(horseFood)
	if (Input.is_action_pressed("ui_left")and !get_node("left").is_colliding()):
		move.x -= 1
	if (Input.is_action_pressed("ui_right")and !get_node("right").is_colliding()):
		move.x += 1
	if (Input.is_action_pressed("ui_up")and !get_node("up").is_colliding()):
		move.y -= 1
	if (Input.is_action_pressed("ui_down")and !get_node("down").is_colliding()):
		move.y += 1
		
	if (Input.is_action_pressed("ui_left") and get_node("left").is_colliding()):
		if (get_node("left").get_collider() and get_node("left").get_collider().is_in_group("deer") and carrots > 0):
			get_node("left").get_collider().eat()
			carrots -= 1
			get_node("HappyDear").play()
	if (Input.is_action_pressed("ui_right") and get_node("right").is_colliding()):
		if (get_node("right").get_collider() and get_node("right").get_collider().is_in_group("deer") and carrots > 0):
			get_node("right").get_collider().eat()
			carrots -= 1
			get_node("HappyDear").play()
	if (Input.is_action_pressed("ui_up") and get_node("up").is_colliding()):
		if (get_node("up").get_collider() and get_node("up").get_collider().is_in_group("deer") and carrots > 0):
			get_node("up").get_collider().eat()
			carrots -= 1
			get_node("HappyDear").play()
	if (Input.is_action_pressed("ui_down") and get_node("down").is_colliding()):
		if (get_node("down").get_collider() and get_node("down").get_collider().is_in_group("deer") and carrots > 0):
			get_node("down").get_collider().eat()
			carrots -= 1
			get_node("HappyDear").play()
	if (Input.is_action_pressed("ui_left") and get_node("left").is_colliding()):
		if (get_node("left").get_collider() and get_node("left").get_collider().is_in_group("horse") and horseFood > 0):
			get_node("left").get_collider().eat()
			horseFood -= 1
			get_node("HorseWinny").play()
	if (Input.is_action_pressed("ui_right") and get_node("right").is_colliding()):
		if (get_node("right").get_collider() and get_node("right").get_collider().is_in_group("horse") and horseFood > 0):
			get_node("right").get_collider().eat()
			horseFood -= 1
			get_node("HorseWinny").play()
	if (Input.is_action_pressed("ui_up") and get_node("up").is_colliding()):
		if (get_node("up").get_collider() and get_node("up").get_collider().is_in_group("horse") and horseFood > 0):
			get_node("up").get_collider().eat()
			horseFood -= 1
			get_node("HorseWinny").play()
	if (Input.is_action_pressed("ui_down") and get_node("down").is_colliding()):
		if (get_node("down").get_collider() and get_node("down").get_collider().is_in_group("horse") and horseFood > 0):
			get_node("down").get_collider().eat()
			horseFood -= 1
			get_node("HorseWinny").play()
	if (move.x < 0):
		get_node("AnimatedSprite").play("runningLeft")
		get_node("AnimatedSprite").flip_h = false
	elif (move.x > 0):
		get_node("AnimatedSprite").play("runningLeft")
		get_node("AnimatedSprite").flip_h = true
	elif (move.y < 0):
		get_node("AnimatedSprite").play("runningUp")
	elif (move.y > 0):
		get_node("AnimatedSprite").play("runningDown")
	if (move == Vector2()):
		get_node("AnimatedSprite").stop()
		get_node("AnimatedSprite").frame = 0
	
	move.normalized()
	position += move * speed * delta

func _on_Player_area_entered(area):
	if (area.is_in_group("collect")):
		get_tree().get_root().get_node("Game").score += 1
		area.queue_free()
		get_node("Crunch").play()
	if (area.is_in_group("enemy")):
		get_tree().get_root().get_node("Game/UI/GameOver").visible = true
		get_tree().get_root().get_node("Game/ChickenClucks").play()
		queue_free()
	if (area.is_in_group("carrot")):
		carrots += 1
		area.queue_free()
		get_node("Crunch").play()
	if (area.is_in_group("horseFood")):
		horseFood += 1
		area.queue_free()
		get_node("Crunch").play()
	if (area.is_in_group("goal")):
		get_tree().get_root().get_node("Game/ChickenClucks").play()
		get_tree().get_root().get_node("Game").nextlevel()
