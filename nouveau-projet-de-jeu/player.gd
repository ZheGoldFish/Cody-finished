extends CharacterBody2D

@onready var _animation_player = $AnimatedSprite2D
const SPEED = 400.0
const JUMP_VELOCITY = -900.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	 #As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Gauche", "Droite")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if is_on_floor()==false:
		if velocity.x >=0:
			_animation_player.play("jump")
		else:
			_animation_player.play("jump_left")
	else:
		if velocity.x >0:
			_animation_player.play("walk")
		elif velocity.x<0:
			_animation_player.play("walk_left")
		else :
			_animation_player.play("idle")
	move_and_slide()
var health : int
func takedamage(amount:int):
	health -= amount	
