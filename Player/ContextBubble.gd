extends Area2D

onready var animationPlayer = $AnimationPlayer

var in_range = false
var interactable = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_interact") and in_range and interactable:
		self.visible = false

func _on_ContextBubble_area_entered(area)->void:
	if str(area) != "[Area2D:1389]":
		self.visible = true
		in_range = true
		animationPlayer.play("AnimateContext")

func _on_ContextBubble_area_exited(area: Area2D)->void:
	if str(area) != "[Area2D:1389]":
		self.visible = false
		in_range = false
		animationPlayer.stop()

func _on_Player_interactable(isInteractable):
	interactable = isInteractable
