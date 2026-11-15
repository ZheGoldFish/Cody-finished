extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if 1==1:
		_animated_sprite.play("default")
