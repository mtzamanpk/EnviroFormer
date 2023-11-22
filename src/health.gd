extends Area2D

func _on_body_entered(body):
	queue_free()
	var health = get_tree().get_nodes_in_group("Health")
	if health.size() == 1:
		Events.health_collected.emit()
