extends Sprite2D

var камни_счетчик_нажатий: int = 1
var номер_сообщения_в_сцене_с_деревом = 1

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 1
	
	if Global.предыдущий_номер_сцены == 2: 
		Global.нижний_бордер_активный = false
	
	Global.поменять_музыку = true
	if 1 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(1) # добавляю в массив номер этой сцены
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Дом Брэндона"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Brandon's home"
	
			
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = true
	
	if Global.записка_брин_взял_со_стола == true:
		$"Записка Брин".visible = false
	if Global.пила_взял == true:
		$"Пила не взята".visible = false
	

func _process(delta: float) -> void:
	if Global.записка_брин_взял_со_стола == true:
		$"Записка Брин".visible = false
	if Global.пила_взял == true:
		$"Пила не взята".visible = false
	
	if Global.запустить_заставку_с_деревом == true:
		Global.заблокировать_ввод = true
		if Global.язык_игры == "en" or Global.язык_игры == "ru":
			$VideoStreamPlayer.visible = true
			Global.в_первой_сцене_должна_быть_музыка = true
			
			if Global.записка_брин_взял_со_стола == false:
				$VideoStreamPlayer.stream = preload("res://Scenes/Scene 1/Видео с деревом Записка на столе.ogv")
			elif Global.записка_брин_взял_со_стола == true:
				$VideoStreamPlayer.stream = preload("res://Scenes/Scene 1/Видео с деревом Записка взята.ogv")
			$VideoStreamPlayer.play()
			
		



func _on_area_2d_камни_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if камни_счетчик_нажатий == 1:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 1/Rocks..mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				камни_счетчик_нажатий += 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Камни."
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "Rocks."
			elif камни_счетчик_нажатий == 2:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 1/Several rocks..mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				камни_счетчик_нажатий += 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Несколько камней."
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "Several rocks."
			elif камни_счетчик_нажатий == 3:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 1/Why do I keep touching this.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				камни_счетчик_нажатий += 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Почему я продолжаю касаться этого?"
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "Why do I keep touching this?"
			elif камни_счетчик_нажатий == 4:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 1/How can these help.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				камни_счетчик_нажатий = 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Как это может помочь?"
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "How can these help?"
			Global.запустить_короткую_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			
			
			
			

		
func _on_video_stream_player_finished() -> void:
	$VideoStreamPlayer.stop()
	$VideoStreamPlayer.visible = false
	Global.в_первой_сцене_должна_быть_музыка = true
	Global.заставка_с_деревом_проигрывается = false
	Global.заставка_с_деревом_закончилась = true
	Global.is_moving = true
	Global.заблокировать_ввод = false
	

	
func _on_touch_screen_button_pressed() -> void:
	_on_video_stream_player_finished()
	Global.заблокировать_ввод = false
	


	
