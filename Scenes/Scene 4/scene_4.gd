extends Sprite2D

var номер_фразы_Брэндона: int = 1
var Слеза

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 4
	
	Слеза = get_node("/root/Game/Итемы/Слеза")
		
	if Global.предыдущий_номер_сцены == 3: 
		Global.правый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 5: 
		Global.левый_бордер_активный = false
	
	if 4 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(4)
	
	
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	if Global.иву_вылечил == true:
		$".".texture = preload("res://Scenes/Scene 4/4 Оригинал иву вылечил.png")
		if Global.язык_игры == "ru":
			Global.текстовое_поле_под_игровым_окном.text = "Цветущее дерево"
		else:
			Global.текстовое_поле_под_игровым_окном.text = "A thriving tree"
	else:
		$".".texture = preload("res://Scenes/Scene 4/4 Оригинал.png")
		if Global.язык_игры == "ru":
			Global.текстовое_поле_под_игровым_окном.text = "Больное дерево"
		else:
			Global.текстовое_поле_под_игровым_окном.text = "A rotting tree"
			
		
func _process(delta: float) -> void:
	if Global.сцена_4_слезу_установил == true:
		Global.сцена_4_слезу_установил = false
		Global.брэндон_идет_в_координату_в_которой_запустится_заставка = true
		Слеза.global_position = Vector2 (906, 444)
		$"AudioStreamPlayer Звук установки капли".play()
	
	if Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации == false:
		if (Global.предыдущий_номер_сцены == 3 and Global.player.global_position == Vector2(1780, 560)) or (Global.предыдущий_номер_сцены == 5 and Global.player.global_position == Vector2(252, 516)):  
			Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = true
			if Global.сцена_4_номер_сообщения_которое_говорит_Брэндон_при_входе_в_локацию == 1:
				_on_timer_время_до_появления_сообщения_при_входе_в_сцену_timeout()
		
	
	if Global.запустить_заставку_с_сцена_4 == true:
		Global.запустить_заставку_с_сцена_4 = false
		Слеза.global_position = Vector2 (20, -120)
		$".".texture = preload("res://Scenes/Scene 4/4 Оригинал иву вылечил.png")
		Global.остановить_музыку = true
		$VideoStreamPlayer.visible = true
		$VideoStreamPlayer.play()
		$"Timer для запуска музыки во время заставки".start()


func _on_timer_время_до_появления_сообщения_при_входе_в_сцену_timeout() -> void:
	if номер_фразы_Брэндона == 1:
		Global.запустить_длинную_анимацию_разговора_Брэндона = true
		Global.текст_брэндона_изменился = true
		Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload ("res://Scenes/Scene 4/What happened. This willow looks half dead.mp3")
		Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
		if Global.язык_игры == "en":
			Global.текст_брэндона.text = "What happened?"
		elif Global.язык_игры == "ru":
			Global.текст_брэндона.text = "Что случилось?"
		$"Timer время до появления сообщения при входе в сцену".wait_time = 2.4
		$"Timer время до появления сообщения при входе в сцену".start()
		$"Timer длительность отображения сообщения при входе в сцену".wait_time = 2.2
		$"Timer длительность отображения сообщения при входе в сцену".start()
	elif номер_фразы_Брэндона == 2:
		if Global.язык_игры == "en":
			Global.текст_брэндона.text = "This willow looks half dead!"
		elif Global.язык_игры == "ru":
			Global.текст_брэндона.text = "Эта ива выглядит полумертвой!"
		$"Timer длительность отображения сообщения при входе в сцену".wait_time = 3.2
		$"Timer длительность отображения сообщения при входе в сцену".start()
		Global.сцена_4_номер_сообщения_которое_говорит_Брэндон_при_входе_в_локацию = 2
	номер_фразы_Брэндона += 1
	
	
func _on_timer_длительность_отображения_сообщения_при_входе_в_сцену_timeout() -> void:
	Global.текст_брэндона.text = ""


func _on_video_stream_player_finished() -> void:
	$VideoStreamPlayer.visible = false
	Global.иву_вылечил = true
	Global.в_сцене_3_должна_быть_заставка_с_Миритом = true
	Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
	Global.заблокировать_ввод = false
	Global.is_moving = true
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Цветущее дерево"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A thriving tree"


func _on_timer_для_запуска_музыки_во_время_заставки_timeout() -> void:
	Global.запустить_музыку = true
