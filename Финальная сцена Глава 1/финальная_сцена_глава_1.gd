extends Node2D

func _ready() -> void:
	$ColorRect.color = Color.BLACK
	$ColorRect.custom_minimum_size = Vector2(1920, 1200)
	$AudioStreamPlayer.play()
	
	if Global.язык_игры == "en":
		$Label.text = "This is the end of the Demo version"
		$"Sprite2D Меню/Label".text = "Exit the game?"
		$"Sprite2D Меню/Label Да".text = "Yes"
		$"Sprite2D Меню/Label Нет".text = "No"
	if Global.язык_игры == "ru":
		$Label.text = "Это конец Демо версии"
		$"Sprite2D Меню/Label".text = "Выйти из игры"
		$"Sprite2D Меню/Label Да".text = "Да"
		$"Sprite2D Меню/Label Нет".text = "Нет"
		
func _on_touch_screen_button_pressed() -> void:
	$"Sprite2D Меню".visible = true
	$TouchScreenButton.visible = false
	
func _on_touch_screen_button_да_pressed() -> void:
	get_tree().quit()

func _on_touch_screen_button_нет_pressed() -> void:
	$"Sprite2D Меню".visible = false
	$TouchScreenButton.visible = true
