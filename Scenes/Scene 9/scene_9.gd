extends Sprite2D

func _ready():
	Global.номер_сцены = 9
	Global.поменять_музыку = true
	
	if Global.предыдущий_номер_сцены == 10:
		Global.правый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 8:
		Global.левый_бордер_активный = false
	
	if 9 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(9)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Озеро печали"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Pool of Sorrow"
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 9/9 Улучшенная.jpg")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 9/9 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 9/9 Улучшенная.jpg")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 9/9 Оригинал.png")
		Global.текстуры_поменялись = false
