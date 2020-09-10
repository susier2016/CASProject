extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 400

var velocity = Vector2.ZERO
var in_range = false

onready var player = get_node("../Player")
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	if !in_range:
		var direction = (player.global_position - global_position).normalized()
		animationTree.set("parameters/Idle/blend_position", direction)
		animationTree.set("parameters/Run/blend_position", direction)
		animationState.travel("Run")
		
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	else: 
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)

func _on_FollowDistance_area_entered(_area):
	in_range = true

func _on_FollowDistance_area_exited(_area):
	in_range = false
