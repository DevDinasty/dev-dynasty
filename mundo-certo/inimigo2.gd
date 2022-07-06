extends KinematicBody2D

var motion = Vector2()
#0 sem ação, 1 = direita, 2 = esquerda.
var state = 0

const STOP = 0
const GO_UP = 100
const GO_DOWN = -100
const GO_RIGHT = 100
const GO_LEFT = -100

func _physics_process(delta):
	if state == 0:
		motion.x = STOP
		motion.y = STOP
	elif state == 1:
		motion.x = GO_RIGHT
	elif state == 2:
		motion.x = STOP
		motion.y = STOP
	elif state == 3:
		motion.x = GO_LEFT
	elif state == 4:
		motion.x = STOP
		motion.y = STOP
	elif state == 5:
		motion.y = GO_UP
	elif state == 6:
		motion.x = STOP
		motion.y = STOP
	elif state == 7:
		motion.y = GO_DOWN
		
	move_and_slide(motion, Vector2(0,-1))

func _on_Timer_timeout():
	state = floor(rand_range(0,8))
