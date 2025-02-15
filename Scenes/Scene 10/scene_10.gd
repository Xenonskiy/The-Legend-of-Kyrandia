extends Sprite2D

func _ready():
	Global.номер_сцены = 10
		
	if Global.предыдущий_номер_сцены == 9:
		Global.левый_бордер_активный = false
		Global.поменять_музыку = true
	elif Global.предыдущий_номер_сцены == 11:
		Global.верхний_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 15:
		Global.нижний_бордер_активный = false
	
	if 10 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(10)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Тёмный лес"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Dark forest"
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = true
	Global.cursor_strelka_down = true
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 10/10 Улучшенная.jpg")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 10/10 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 10/10 Улучшенная.jpg")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 10/10 Оригинал.png")
		Global.текстуры_поменялись = false
