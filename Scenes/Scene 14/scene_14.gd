extends Sprite2D

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
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
	
