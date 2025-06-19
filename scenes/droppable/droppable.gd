extends Area3D
class_name Droppable

@onready var model: Node3D = $Model
@onready var drop_list: Array[ItemData] = [
	preload("res://resources/small_sword.tres"),
	preload("res://resources/small_shield.tres")
]
var data: ItemData

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	var item_to_drop = drop_list.pick_random()
	if item_to_drop is MyEquipment:
		model.add_child(item_to_drop.drop_model.instantiate())
		data = item_to_drop
	await get_tree().create_timer(60).timeout
	queue_free()

func _on_body_entered(body: Node3D):
	if body is Player:
		queue_free()
