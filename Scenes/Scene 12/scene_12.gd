extends Sprite2D

func _ready():
	Global.номер_сцены = 12
		
	if Global.предыдущий_номер_сцены == 11:
		Global.левый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 13:
		Global.правый_бордер_активный = false
	
	if 12 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(12)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Лесной алтарь"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A forest altar"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 12/12 Улучшенная.jpg")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 12/12 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 12/12 Улучшенная.jpg")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 12/12 Оригинал.png")
		Global.текстуры_поменялись = false
