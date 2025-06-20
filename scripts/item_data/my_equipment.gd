extends EquipmentData
class_name MyEquipment

@export var drop_model: PackedScene

## 检测装备是否可用，需重写
func test_need(_slot_name: String) -> bool:
	return true

## 装备时调用，需重写
func equipped(_slot_name: String) -> void:
	pass

## 脱装备时调用，需重写
func unequipped(_slot_name: String) -> void:
	pass

## 丢弃物品时调用，需重写
func drop() -> void:
	Global.game.throw_item(self)
