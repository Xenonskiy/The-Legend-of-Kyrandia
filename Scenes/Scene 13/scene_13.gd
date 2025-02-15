extends Sprite2D

func _ready():
	Global.номер_сцены = 13
	Global.левый_бордер_активный = false
		
	if 13 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(13)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Высокий утёс"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A tall cliff"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 13/13 Улучшенная.jpg")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 13/13 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 13/13 Улучшенная.jpg")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 13/13 Оригинал.png")
		Global.текстуры_поменялись = false
