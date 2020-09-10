extends Area2D

func _on_Dialogue_area_entered(area: Area2D)->void:
	print("interactable")

func _on_Dialogue_area_exited(area: Area2D)->void:
	print("not interactable")
