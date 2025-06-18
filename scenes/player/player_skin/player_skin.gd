extends Node3D
class_name PlayerSkin

@onready var damage_timer: Timer = $DamageTimer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hit_box: HitBox = $HitBox

var state_machine: AnimationNodeStateMachinePlayback

var is_attacking: bool = false

func _ready() -> void:
	state_machine = animation_tree["parameters/playback"]

var linear_velocity: float = 0:
	set(value):
		animation_tree.set("parameters/Idle And Move/blend_position", value)

func attack() -> void:
	animation_tree.set("parameters/conditions/attack", true)

func stop_attack() -> void:
	animation_tree.set("parameters/conditions/attack", false)

func _process(_delta: float) -> void:
	var was_attacking = is_attacking
	is_attacking = state_machine.get_current_node() == "Attack"
	if is_attacking and not was_attacking:
		damage_timer.start()
