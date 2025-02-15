extends Sprite2D

func _ready():
	Global.номер_сцены = 4
	if Global.предыдущий_номер_сцены == 3: 
		Global.правый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 5: 
		Global.левый_бордер_активный = false
	
	if 4 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(4)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Больное дерево"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A rotting tree"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 4/4 Улучшенная.png")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 4/4 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 4/4 Улучшенная.png")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 4/4 Оригинал.png")
		Global.текстуры_поменялись = false
