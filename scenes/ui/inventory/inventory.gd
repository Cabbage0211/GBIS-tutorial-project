extends ColorRect
class_name Inventory

func _ready() -> void:
	hide()
	mouse_entered.connect(func(): Global.player.is_busy = true)
	mouse_exited.connect(func(): Global.player.is_busy = false)
