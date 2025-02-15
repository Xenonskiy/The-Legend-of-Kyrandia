extends Sprite2D

func _ready():
	Global.номер_сцены = 15
		
	if Global.предыдущий_номер_сцены == 10:
		Global.верхний_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 16:
		Global.нижний_бордер_активный = false
		
	if 15 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(15)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Каменная гряда"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A rocky outcropping"
	
	
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = true
	Global.cursor_strelka_down = true
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 15/15 Улучшенная.jpg")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 15/15 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 15/15 Улучшенная.jpg")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 15/15 Оригинал.png")
		Global.текстуры_поменялись = false
