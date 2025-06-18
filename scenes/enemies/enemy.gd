extends CharacterBody3D
class_name Enemy

signal sig_dead(dead_enemy: Enemy)

@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var skeleton_warrior: EnemySkin = $Skeleton_Warrior
var hp: int = 3

func get_hit(damage: int) -> void:
	hp -= damage
	if hp > 0:
		skeleton_warrior.get_hit()
	else:
		skeleton_warrior.dead()
		collision_shape_3d.queue_free()
		sig_dead.emit(self)
