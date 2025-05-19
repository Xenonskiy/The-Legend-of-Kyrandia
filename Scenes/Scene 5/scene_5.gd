extends Sprite2D

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	$AudioStreamPlayer.play()
	$AnimatedSprite2D.play("default")
	
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
	
func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
	$AnimatedSprite2D.play("default")
