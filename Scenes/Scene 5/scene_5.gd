extends Sprite2D

func _ready():
	Global.номер_сцены = 5
	if Global.предыдущий_номер_сцены == 6:
		Global.верхний_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 4: 
		Global.правый_бордер_активный = false
		
	if 5 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(5)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Южный утёс"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A southern cliff"
	
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = true
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 5/5 Улучшенная.png")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 5/5 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 5/5 Улучшенная.png")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 5/5 Оригинал.png")
		Global.текстуры_поменялись = false
