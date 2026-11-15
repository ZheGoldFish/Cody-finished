extends PathFollow2D


# Called when the node enters the scene tree for the first time.
var speed = 0.30
func _process(delta:float)-> void:
	progress_ratio += delta*speed
