extends Node3D
class_name EnemySkin

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("Idle")
	animation_player.animation_finished.connect(_on_animation_finished)

func get_hit() -> void:
	animation_player.play("Hit_A")

func dead() -> void:
	animation_player.play("Death_A")

func _on_animation_finished(anim_name) -> void:
	if anim_name == "Hit_A":
		animation_player.play("Idle")
