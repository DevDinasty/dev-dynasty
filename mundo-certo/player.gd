extends KinematicBody2D

onready var animation: AnimationPlayer = get_node("Animation")

var velocity: Vector2

export(int) var speed

func _physics_process(_delta: float) -> void:
	move()
	animate()
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://src/Battle.tscn")

func move() -> void:
	var direction_vector: Vector2 = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	velocity = direction_vector * speed
	velocity = move_and_slide(velocity)
	
func animate() -> void:
	if velocity != Vector2.ZERO:
		animation.play("Run")
	else:
		animation.play("Idle")
