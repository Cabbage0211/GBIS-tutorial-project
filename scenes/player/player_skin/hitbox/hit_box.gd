extends Area3D
class_name HitBox

@onready var collision: CollisionShape3D = $Collision

func _ready() -> void:
	await get_tree().process_frame
	Global.player.sig_player_cause_damage.connect(damage)
	body_entered.connect(_on_body_entered)

func damage() -> void:
	collision.disabled = false
	await get_tree().create_timer(0.1).timeout
	collision.disabled = true

func _on_body_entered(body: Node3D) -> void:
	if body is Enemy:
		body.get_hit(1)
