extends Sprite2D

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 16
		
	if Global.предыдущий_номер_сцены == 15:
		Global.верхний_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 17:
		Global.левый_бордер_активный = false
		Global.поменять_музыку = true
	
	if 16 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(16)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Вход в пещеру"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A cavernous entrance"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = true
	Global.cursor_strelka_down = false
	
