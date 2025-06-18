extends CharacterBody3D
class_name Enemy

signal sig_dead(dead_enemy: Enemy)

@export var skins: Array[PackedScene]

@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var skin: EnemySkin
var hp: int = 3

func _ready() -> void:
	skin = skins[randi_range(0, skins.size() - 1)].instantiate()
	add_child(skin)

func get_hit(damage: int) -> void:
	hp -= damage
	if hp > 0:
		skin.get_hit()
	else:
		skin.dead()
		collision_shape_3d.queue_free()
		sig_dead.emit(self)
