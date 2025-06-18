extends Node3D
class_name Game

@export var enemy_scene: PackedScene

@onready var spawn_timer: Timer = $SpawnTimer
@onready var enemy_container: Node = $EnemyContainer

var enemies: Array[Enemy] = []

func _ready() -> void:
	spawn_timer.timeout.connect(_spawn)

func _spawn() -> void:
	if enemies.size() < 1:
		var enemy: Enemy = enemy_scene.instantiate()
		enemy_container.add_child(enemy)
		enemy.global_position = Vector3(randf_range(-4.5, 4.5), 0, randf_range(-4.5, 4.5))
		enemies.append(enemy)
		enemy.sig_dead.connect(_on_enemy_dead)

func _on_enemy_dead(dead_enemy: Enemy) -> void:
	print("drop something...")
	await get_tree().create_timer(1).timeout
	enemies.erase(dead_enemy)
	dead_enemy.queue_free()
