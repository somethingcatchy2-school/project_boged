extends CharacterBody2D

@export var speed: float = 60
@export var accel: float = 5
@export var rotation_speed: float = 5 # How quickly the player rotates

func _physics_process(_delta: float) -> void:
	var input_x = (Input.get_action_strength("right2") - Input.get_action_strength("left2"))
	var input_y = (Input.get_action_strength("down2") - Input.get_action_strength("up2"))

	var direction = Vector2(input_x, input_y)
	
	# Calculate velocity
	velocity.x = move_toward(velocity.x, speed * input_x, accel)
	velocity.y = move_toward(velocity.y, speed * input_y, accel)

	if direction != Vector2.ZERO:
		# Calculate target rotation based on movement direction
		var target_rotation = direction.angle()
		
		# Smoothly rotate towards the target angle
		rotation = lerp_angle(rotation, target_rotation, rotation_speed * _delta)
	
	move_and_slide()
