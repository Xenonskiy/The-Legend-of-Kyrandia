extends Sprite2D

var номер_текстового_сообщения: int = 1

func _ready():
	Global.номер_сцены = 7
	Global.правый_бордер_активный = false
	Global.поменять_музыку = true
	
	if 7 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(7)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Внутри Храма"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Inside the Temple"
	
	
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 7/7 Улучшенная.png")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 7/7 Оригинал.png")
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 7/7 Улучшенная.png")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 7/7 Оригинал.png")
		Global.текстуры_поменялись = false
	if Global.запустить_заставку_с_брин == true:
		запустить_заставку_с_брин()
		Global.запустить_заставку_с_брин = false

func _on_area_2d_брин_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false: 
		Global.нажал_на_брин = true
		

func _on_video_stream_player_finished() -> void:
	$"Брин".visible = true
	$"Брин/Текст Брин".text = "Добро пожаловать, \nБрэндон?"
	$"Брин/Текст Брин/Timer".start()
	$VideoStreamPlayer.visible = false
	
func запустить_заставку_с_брин():
	if Global.сколько_раз_подошел_к_брин == 1:
		$"Брин/Текст Брин/Timer".start()
		if номер_текстового_сообщения == 1:
			if Global.язык_игры == "ru":
				Global.текст_брэндона.text = "Брин, с дедом беда!"
		elif номер_текстового_сообщения == 2:
			if Global.язык_игры == "ru":
				$"Брин/Текст Брин".text = "Что случилось, Брэндон?"
		elif номер_текстового_сообщения == 3:
			if Global.язык_игры == "ru":
				Global.текст_брэндона.text = "Его превратили в камень!"
		elif номер_текстового_сообщения == 4:
			if Global.язык_игры == "ru":
				Global.текст_брэндона.text = "Я не знаю, как это \nпроизошло!"
		elif номер_текстового_сообщения == 5:
			if Global.язык_игры == "ru":
				$"Брин/Текст Брин".text = "Возможно ключ к разгадке \nу тебя дома."
		
		
func _on_timer_timeout() -> void:
	if Global.сколько_раз_подошел_к_брин == 0:
		$"Брин/Текст Брин".text = ""
	if Global.сколько_раз_подошел_к_брин == 1:
		Global.текст_брэндона.text = ""
		$"Брин/Текст Брин".text = ""
		if номер_текстового_сообщения <= 5:
			номер_текстового_сообщения += 1
			запустить_заставку_с_брин()
		if номер_текстового_сообщения == 5:
			Global.заблокировать_ввод = false
