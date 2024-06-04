extends RigidBody2D



func _on_distroy_timer_timeout():
	print("time out")
	queue_free()
