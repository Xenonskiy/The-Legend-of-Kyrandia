extends Sprite2D

func _ready():
	Global.номер_сцены = 17
		
	if Global.предыдущий_номер_сцены == 16:
		Global.правый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 18:
		Global.левый_бордер_активный = false
		
	Global.поменять_музыку = true
	
	if 17 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(17)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Поломанный мост"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A ruined bridge"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 17/17 Улучшенная.jpg")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 17/17 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 17/17 Улучшенная.jpg")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 17/17 Оригинал.png")
		Global.текстуры_поменялись = false
