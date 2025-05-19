extends Sprite2D

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 13
	Global.левый_бордер_активный = false
	
	if Global.в_сцене_11_или_13_нужно_запустить_заново_музыку == true:
		Global.в_сцене_11_или_13_нужно_запустить_заново_музыку = false
		Global.запустить_музыку = true
		
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
	
	
