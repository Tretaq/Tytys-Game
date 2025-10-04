extends Area2D

@export var jump_force: float = -500
@export var cooldown_time: float = 1
@onready var animation_player = $AnimationPlayer
var can_trigger: bool = true

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and can_trigger:
		body.velocity.y = jump_force
		animation_player.play("jump")

		can_trigger = false
		await get_tree().create_timer(cooldown_time).timeout
		animation_player.play("RESET")
		can_trigger = true
