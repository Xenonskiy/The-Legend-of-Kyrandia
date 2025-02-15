extends Sprite2D

func _ready():
	Global.номер_сцены = 14
	Global.правый_бордер_активный = false
		
	if 14 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(14)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Тёмный лес"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Dark forest"
	
	
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 14/14 Улучшенная.jpg")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 14/14 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 14/14 Улучшенная.jpg")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 14/14 Оригинал.png")
		Global.текстуры_поменялись = false
