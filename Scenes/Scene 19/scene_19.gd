extends Sprite2D

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 19
		
	Global.левый_бордер_активный = true
	Global.правый_бордер_активный = true
		
	if Global.предыдущий_номер_сцены == 18:
		Global.правый_бордер_активный = false
	
	if 19 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(19)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Странная изба"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A strange hut"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = true
	
