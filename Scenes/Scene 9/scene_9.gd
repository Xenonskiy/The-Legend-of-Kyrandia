extends Sprite2D

var speed_капля_1: int = 0
var speed_капля_2: int = 0
var speed_капля_3: int = 0
var speed_капля_4: int = 0
var speed_капля_5: int = 0

var номер_сообщения: int = 1
var player
var Брэндон_пришел_в_стартовую_позицию: bool = false
var Слеза

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 9
	Global.поменять_музыку = true
	
	$"Текст мирита".global_position = Vector2 (1000, 150)
	player = get_node("/root/Game/player")
	Слеза = get_node("/root/Game/Итемы/Слеза")
	
	if Global.в_сцене_9_должна_быть_заставка_с_Миритом == true:
		$"Sprite2D Мирит".visible = true
	
	if Global.предыдущий_номер_сцены == 10:
		Global.правый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 8:
		Global.левый_бордер_активный = false
	
	if 9 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(9)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Озеро печали"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Pool of Sorrow"
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	
		
	$"Капля 1".position = Vector2(381, randf_range(100, 500))  # Случайное значение по Y
	$"Капля 2".position = Vector2(549, randf_range(100, 500))
	$"Капля 3".position = Vector2(693, randf_range(100, 500))
	$"Капля 4".position = Vector2(741, randf_range(100, 500))
	$"Капля 5".position = Vector2(837, randf_range(100, 500))
	speed_капля_1 = randf_range(200, 400)  # Устанавливаем случайное значение скорости
	speed_капля_2 = randf_range(200, 400)
	speed_капля_3 = randf_range(200, 400)
	speed_капля_4 = randf_range(200, 400)
	speed_капля_5 = randf_range(200, 400)
	
	$"AudioStreamPlayer звук капли/Timer звук капли".wait_time = randf_range(1.5, 4.0) 
	$"AudioStreamPlayer звук капли/Timer звук капли".start()
	$"AudioStreamPlayer звук второй капли/Timer звук второй капли".wait_time = randf_range(5.0, 12.0)
	$"AudioStreamPlayer звук второй капли/Timer звук второй капли".start()


		
		
func _physics_process(delta: float) -> void:
	# Когда Брэндон достигнет стартовой позиции в этой локации, разблокируется управление
	if Брэндон_пришел_в_стартовую_позицию == false:
		if Global.предыдущий_номер_сцены == 8 and Global.player.global_position == Vector2(132, 468):
			Global.заблокировать_ввод = false
			Брэндон_пришел_в_стартовую_позицию = true
		elif Global.предыдущий_номер_сцены == 10 and Global.player.global_position == Vector2(1780, 560):
			Global.заблокировать_ввод = false
			Брэндон_пришел_в_стартовую_позицию = true
	
	
	if Global.в_сцене_9_должна_быть_заставка_с_Миритом == true and player.global_position == Vector2(132, 468):
		Global.в_сцене_9_должна_быть_заставка_с_Миритом = false
		Global.заблокировать_ввод = true
		$"Анимация Мирита".visible = true
		$"Анимация Мирита".play("default")
		$"AudioStreamPlayer Диалог с миритом Сцена 9".play()
		_on_timer_время_до_появления_сообщения_timeout()
		
		
		
		
	$"Капля 1".position.y += speed_капля_1 / 60.0  # Двигаем каплю вниз. Фиксируем смещение, игнорируя delta  
	if $"Капля 1".position.y >= 543:
		$"Капля 1".position = Vector2(381, -100)
		speed_капля_1 = 0
		$"Капля 1/Timer_капля_1".wait_time = randf_range(0.3, 4.0)  # Устанавливаем случайное время
		$"Капля 1/Timer_капля_1".start()
		$"AnimatedSprite2D Капля 1".visible = true
		$"AnimatedSprite2D Капля 1".play("default")
		
	$"Капля 2".position.y += speed_капля_2 / 60.0  
	if $"Капля 2".position.y >= 567:
		$"Капля 2".position = Vector2(549, -100)
		speed_капля_2 = 0
		$"Капля 2/Timer_капля_2".wait_time = randf_range(0.3, 4.0) 
		$"Капля 2/Timer_капля_2".start()
		$"AnimatedSprite2D Капля 2".visible = true
		$"AnimatedSprite2D Капля 2".play("default")
		
	$"Капля 3".position.y += speed_капля_3 / 60.0  
	if $"Капля 3".position.y >= 519:
		$"Капля 3".position = Vector2(693, -100)
		speed_капля_3 = 0
		$"Капля 3/Timer_капля_3".wait_time = randf_range(0.3, 4.0) 
		$"Капля 3/Timer_капля_3".start()
		$"AnimatedSprite2D Капля 3".visible = true
		$"AnimatedSprite2D Капля 3".play("default")
		
	$"Капля 4".position.y += speed_капля_4 / 60.0  
	if $"Капля 4".position.y >= 567:
		$"Капля 4".position = Vector2(741, -100)
		speed_капля_4 = 0
		$"Капля 4/Timer_капля_4".wait_time = randf_range(0.3, 4.0) 
		$"Капля 4/Timer_капля_4".start()
		$"AnimatedSprite2D Капля 4".visible = true
		$"AnimatedSprite2D Капля 4".play("default")
		
	$"Капля 5".position.y += speed_капля_5 / 60.0  
	if $"Капля 5".position.y >= 519:
		$"Капля 5".position = Vector2(837, -100)
		speed_капля_5 = 0
		$"Капля 5/Timer_капля_5".wait_time = randf_range(0.3, 4.0) 
		$"Капля 5/Timer_капля_5".start()
		$"AnimatedSprite2D Капля 5".visible = true
		$"AnimatedSprite2D Капля 5".play("default")
		
	if Global.запустить_заставку_Брэндон_ловит_слезу == true:
		Global.запустить_заставку_Брэндон_ловит_слезу = false
		$"AnimatedSprite2D Брэндон ловит слезу".visible = true
		$"AnimatedSprite2D Брэндон ловит слезу".play("default")
		Global.is_moving = false
		Global.заблокировать_ввод = true
		#$"AnimatedSprite2D Брэндон ловит слезу/Timer".wait_time = 2.3
		#$"AnimatedSprite2D Брэндон ловит слезу/Timer".start()
		
		
func _on_timer_капля_1_timeout() -> void:
	speed_капля_1 = randf_range(200, 400)  # Устанавливаем случайное значение скорости
	
func _on_timer_капля_2_timeout() -> void:
	speed_капля_2 = randf_range(200, 400)
	
func _on_timer_капля_3_timeout() -> void:
	speed_капля_3 = randf_range(200, 400)
	
func _on_timer_капля_4_timeout() -> void:
	speed_капля_4 = randf_range(200, 400)
	
func _on_timer_капля_5_timeout() -> void:
	speed_капля_5 = randf_range(200, 400)
	


func _on_timer_звук_капли_timeout() -> void:
	$"AudioStreamPlayer звук капли".play()
	$"AudioStreamPlayer звук капли/Timer звук капли".wait_time = randf_range(1.5, 3.0) 
	$"AudioStreamPlayer звук капли/Timer звук капли".start()
	
	
func _on_timer_звук_второй_капли_timeout() -> void:
	$"AudioStreamPlayer звук второй капли".play()
	$"AudioStreamPlayer звук второй капли/Timer звук второй капли".wait_time = randf_range(5.0, 12.0)
	$"AudioStreamPlayer звук второй капли/Timer звук второй капли".start()
	
# Если кликнуть на пруд, запускается длинная анимация разговора Брэндона
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.Брэндон_ловил_слезу == false and Брэндон_пришел_в_стартовую_позицию == true: 
				Global.Брэндон_ловил_слезу = true
				Global.запустить_длинную_анимацию_разговора_Брэндона = true
				Global.текст_брэндона_изменился = true
				
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 9/I bet I can catch a teardrop.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					Global.текст_брэндона.text = "I bet I can catch\na teardrop!"
				elif Global.язык_игры == "ru":
					Global.текст_брэндона.text = "Спорим, я смогу\nпоймать слезу!"
				$"Timer длительность отображения сообщения".wait_time = 3.5
				$"Timer длительность отображения сообщения".start()
				

func _on_animated_sprite_2d_брэндон_ловит_слезу_animation_finished() -> void:
	$"AnimatedSprite2D Брэндон ловит слезу".visible = false
	Global.запустить_короткую_анимацию_разговора_Брэндона = true
	Global.текст_брэндона_изменился = true
	Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 9/Got one.mp3")
	Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
	if Global.язык_игры == "en":
		Global.текст_брэндона.text = "Got one!"
	elif Global.язык_игры == "ru":
		Global.текст_брэндона.text = "Есть одна!"
	$"Timer длительность отображения сообщения".wait_time = 1.3
	$"Timer длительность отображения сообщения".start()

func _on_timer_timeout() -> void:
	$"AnimatedSprite2D Брэндон ловит слезу/AudioStreamPlayer".stream = preload("res://Scenes/Scene 9/Got one.mp3")
	$"AnimatedSprite2D Брэндон ловит слезу/AudioStreamPlayer".play()
	Global.Брэндон_должен_произнести_фразу_Got_one = true
	
	
func _on_timer_время_до_появления_сообщения_timeout() -> void:
	if Global.язык_игры == "en":
		$"Текст мирита".text = "You're following pretty\nclose for someone who's\nnot chasing me!"
	elif Global.язык_игры == "ru":
		$"Текст мирита".text = "Ты следуешь слишком\nблизко за тем,\nза кем не гонишься!"
	$"Timer длительность отображения сообщения".wait_time = 3.4
	$"Timer длительность отображения сообщения".start()
	

func _on_timer_длительность_отображения_сообщения_timeout() -> void:
	$"Текст мирита".text = ""
	if Global.текст_брэндона.text == "I bet I can catch\na teardrop!" or Global.текст_брэндона.text == "Спорим, я смогу\nпоймать слезу!":
		Global.текст_брэндона.text = ""
		Global.брэндон_идет_в_координату_в_которой_запустится_заставка = true
	if Global.текст_брэндона.text == "Got one!" or Global.текст_брэндона.text == "Есть одна!":
		Global.текст_брэндона.text = ""
		Global.is_moving = true
		Global.заблокировать_ввод = false
		Слеза.global_position = Vector2 (1200, 600)
		
		

func _on_анимация_мирита_animation_finished() -> void:
	$"Sprite2D Мирит".visible = false
	$"Анимация Мирита".visible = false
	Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
	Global.заблокировать_ввод = false
	Global.is_moving = true
	Global.в_сцене_11_должна_быть_заставка_с_Миритом = true
