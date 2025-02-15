extends Sprite2D

var камни_счетчик_нажатий: int = 1

func _ready():
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
		
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 1/1 Улучшенная.png")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 1/1 Оригинал.png")
	
	
		
func _process(delta: float) -> void:
	if Global.записка_брин_взял_со_стола == true:
		$"Записка Брин".visible = false
	if Global.пила_взял == true:
		$"Пила не взята".visible = false
	if Global.поменять_музыку == true and Global.в_первой_сцене_должна_быть_музыка == true:
		запустить_музыку()
	
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 1/1 Улучшенная.png")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 1/1 Оригинал.png")
		Global.текстуры_поменялись = false
		
	if Global.запустить_заставку_с_деревом == true:
		Global.запустить_заставку_с_деревом = false
		$VideoStreamPlayer.visible = true
		$VideoStreamPlayer.play()
		
		



func _on_area_2d_камни_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if камни_счетчик_нажатий == 1:
				камни_счетчик_нажатий += 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Камни."
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "Rocks."
			elif камни_счетчик_нажатий == 2:
				камни_счетчик_нажатий += 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Несколько камней."
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "Several rocks."
			elif камни_счетчик_нажатий == 3:
				камни_счетчик_нажатий += 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Почему я продолжаю касаться этого?"
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "Why do I keep touching this?"
			elif камни_счетчик_нажатий == 4:
				камни_счетчик_нажатий = 1
				if Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Как это может помочь?"
				elif Global.язык_игры == "en":
					Global.текст_брэндона.text = "How can these help?"
			Global.текст_брэндона_изменился = true
			Global.is_moving = false
			
func _on_video_stream_player_finished() -> void:
	$VideoStreamPlayer.stop()
	$VideoStreamPlayer.visible = false
	Global.в_первой_сцене_должна_быть_музыка = true
	Global.заставка_с_деревом_проигрывается = false
	Global.заставка_с_деревом_закончилась = true
	Global.is_moving = true
	запустить_музыку()
	

func _on_touch_screen_button_pressed() -> void:
	_on_video_stream_player_finished()
	
func запустить_музыку():
	if Global.в_первой_сцене_должна_быть_музыка == true:
		# Если музыка уже играет, сохранить текущую позицию
		if $AudioStreamPlayer.playing:
			Global.текущая_секунда_музыки = $AudioStreamPlayer.get_playback_position()
		else:
			Global.текущая_секунда_музыки = 124.0
			
		# Выбор трека в зависимости от сцены и настроек
		if Global.номер_сцены == 1 and Global.музыка_улучшенная == false:
			Global.музыка = preload("res://Assets/Музыка/05 Оригинал Speech of the Land.mp3")
		elif Global.номер_сцены == 1 and Global.музыка_улучшенная == true:
			Global.музыка = preload("res://Assets/Музыка/05 Улучшенная Speech of the Land.mp3")
			
		# Установка нового трека и воспроизведение с сохраненной позиции
		$AudioStreamPlayer.stream = Global.музыка
		$AudioStreamPlayer.play(Global.текущая_секунда_музыки)

		# Сброс флага изменения музыки
		Global.поменять_музыку = false
	
