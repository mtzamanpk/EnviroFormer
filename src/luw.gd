extends Area2D

func _on_body_entered(body):
	queue_free()
	var luw = get_tree().get_nodes_in_group("luw")
	if luw.size() == 1:
		Events.luw_collected.emit()
