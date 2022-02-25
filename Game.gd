extends Node

var currentLevel
var score

func _ready():
	currentLevel = 1
	score = 0
	
func nextlevel():
	get_node("Level" + str(currentLevel)).queue_free()
	
	currentLevel += 1
	
	var newLevelPath = load("res://Level" + str(currentLevel) + ".tscn")
	
	if newLevelPath:
		var newLevel = newLevelPath.instance()
		call_deferred("add_child", newLevel)
	else:
		get_node("UI/GameWin").visible = true










"""
extends Node2D

var score

func _ready():
	randomize()
	get_node("EnemyTimer").start()
	
func _on_EnemyTimer_timeout():
	var newEnemyPath = load("res://Enemy.tscn")
	var newEnemy = newEnemyPath.instance()
	add_child(newEnemy)
	
	get_node("EnemyPath/EnemySpawn").set_offset(randi())
	
	
	var direction = get_node("EnemyPath/EnemySpawn").rotation + PI / 2
	direction += rand_range(-PI / 4, PI / 4)
	newEnemy.rotation = direction
	
	newEnemy.linear_velocity = Vector2(rand_range(newEnemy.minSpeed, newEnemy.maxSpeed), 0)
	newEnemy.linear_velocity = newEnemy.linear_velocity.rotated(direction)
	"""
