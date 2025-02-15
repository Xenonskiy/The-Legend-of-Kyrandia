extends Sprite2D

func _ready():
	Global.номер_сцены = 18
		
	if Global.предыдущий_номер_сцены == 17:
		Global.правый_бордер_активный = false
		Global.поменять_музыку = true
	elif Global.предыдущий_номер_сцены == 19:
		Global.левый_бордер_активный = false
	
	if 18 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(18)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Строевой лес"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "The Timbermist Woods"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 18/18 Улучшенная.png")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 18/18 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 18/18 Улучшенная.png")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 18/18 Оригинал.png")
		Global.текстуры_поменялись = false
