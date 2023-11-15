extends Area2D

func _on_body_entered(body):
	queue_free()
	var Garbages = get_tree().get_nodes_in_group("Garbages")
	if Garbages.size() == 1:
		Events.garbages_collected.emit()
