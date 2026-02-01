extends CharacterBody2D

@export var movement_speed: float = 100
var character_direction: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2.DOWN

func _physics_process(delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.y = Input.get_axis("move_up", "move_down")
	character_direction = character_direction.normalized()

	velocity = character_direction * movement_speed
	if character_direction != Vector2.ZERO:
		if abs(character_direction.x) > abs(character_direction.y):
			# LEFT / RIGHT
			if character_direction.x > 0:
				$sprite.animation = "Walk_Right"
			else:
				$sprite.animation = "Walk_Left"
		else:
			# UP / DOWN
			if character_direction.y < 0:
				$sprite.animation = "Walk_Up"
			else:
				$sprite.animation = "Walk_Down"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		$sprite.animation = "idle"

	move_and_slide()
	velocity = character_direction * movement_speed
