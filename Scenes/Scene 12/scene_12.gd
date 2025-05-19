extends Sprite2D

var номер_сообщения: int = 1 # для диалога Брэндона после получения амулета

#var мрамор_находится_в_зоне_куда_его_нужно_установить: bool = false
#var второе_сообщение_Брэндона: bool = false

var номер_сообщения_брэндона_при_установке_мрамора: int = 1
#var запустить_заставку_ремонт_алтаря: bool = false

var роза_белая_находится_в_зоне_активации: bool = false
var запустить_активацию_розы_белой: bool = false


var текст_Брэндона: Label
var Роза_1
var Роза_2
var Роза_3
var Роза_4
var Роза_5
var Роза_белая
var Мрамор

func _ready():
	Global.нельзя_положить_предмет = false
	if Global.алтарь_починен == true:
		$"Алтарь починен".visible = true
	
	if Global.роза_1_взята == true:
		$"Цветок 1/Роза 1".visible = true
		$"Цветок 1/Area2D Цветок 1".visible = false
	if Global.роза_2_взята == true:
		$"Цветок 2/Роза 2".visible = true
		$"Цветок 2/Area2D Цветок 2".visible = false
	if Global.роза_3_взята == true:
		$"Цветок 3/Роза 3".visible = true
		$"Цветок 3/Area2D Цветок 3".visible = false
	if Global.роза_4_взята == true:
		$"Цветок 4/Роза 4".visible = true
		$"Цветок 4/Area2D Цветок 4".visible = false
	if Global.роза_5_взята == true:
		$"Цветок 5/Роза 5".visible = true
		$"Цветок 5/Area2D Цветок 5".visible = false
	
	
	текст_Брэндона = get_node("/root/Game/player/Текст Брэндона")
	Роза_1 = get_node("/root/Game/Итемы/Роза 1")
	Роза_2 = get_node("/root/Game/Итемы/Роза 2")
	Роза_3 = get_node("/root/Game/Итемы/Роза 3")
	Роза_4 = get_node("/root/Game/Итемы/Роза 4")
	Роза_5 = get_node("/root/Game/Итемы/Роза 5")
	Роза_белая = get_node("/root/Game/Итемы/Роза белая")
	Мрамор = get_node("/root/Game/Итемы/Мрамор")
	
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.номер_сцены = 12
		
	if Global.предыдущий_номер_сцены == 11:
		Global.левый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 13:
		Global.правый_бордер_активный = false
	
	if 12 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(12)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Лесной алтарь"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A forest altar"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	
		
func _process(delta: float) -> void:
	if Global.запустить_заставку_ремонт_алтаря == true:
		Global.запустить_заставку_ремонт_алтаря = false
		Global.заблокировать_ввод = true
		Global.is_moving = false
		Мрамор.global_position = Vector2 (820, -120)
		$"AnimatedSprite2D Алтарь установка мрамора".visible = true
		$"AnimatedSprite2D Алтарь установка мрамора".play("default")
		$"AudioStreamPlayer звук когда мрамор установил".play()
		Global.алтарь_починен = true	
	if Global.запустить_заставку_превращения_белой_розы_в_амулет == true:
		Global.запустить_заставку_превращения_белой_розы_в_амулет = false
		Global.заблокировать_ввод = true
		Global.is_moving = false
		Global.остановить_музыку = true
		Global.в_сцене_11_или_13_нужно_запустить_заново_музыку = true
		Global.амулет_получил = true
		
		$"AnimatedSprite2D активация белой розы".visible = true
		Роза_белая.global_position.y = 246
		$"AnimatedSprite2D активация белой розы".global_position = Роза_белая.global_position - Vector2 (39, 24)
		Роза_белая.global_position = Vector2 (620, -120)
		$"AnimatedSprite2D активация белой розы".play("default")
		$"AudioStreamPlayer превращение розы в амулет".play()
		
		
		
		

func _on_area_2d_цветок_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.число_роз_у_алтаря == 5:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow I hope this is what Brynn wants.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow! I hope this is what\nBrynn wants."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой! Надеюсь это то,\nчто хочет Брин."
			elif Global.число_роз_у_алтаря == 4:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Nasty thorns.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Nasty thorns!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Противные шипы!"
			elif Global.число_роз_у_алтаря == 3:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			elif Global.число_роз_у_алтаря == 2:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/I'll take a whole bouquet.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "I'll take a whole bouquet."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Я возьму целый букет."
			elif Global.число_роз_у_алтаря == 1:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			Global.число_роз_у_алтаря -= 1
			$"Цветок 1/Роза 1".visible = true
			$"Цветок 1/Area2D Цветок 1".visible = false
			$Timer.wait_time = 3.7
			$Timer.start()
			Global.роза_1_взята = true
			Global.запустить_короткую_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			Роза_1.global_position = Vector2 (900, 600)
			

func _on_area_2d_цветок_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.число_роз_у_алтаря == 5:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow I hope this is what Brynn wants.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow! I hope this is what\nBrynn wants."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой! Надеюсь это то,\nчто хочет Брин."
			elif Global.число_роз_у_алтаря == 4:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Nasty thorns.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Nasty thorns!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Противные шипы!"
			elif Global.число_роз_у_алтаря == 3:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			elif Global.число_роз_у_алтаря == 2:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/I'll take a whole bouquet.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "I'll take a whole bouquet."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Я возьму целый букет."
			elif Global.число_роз_у_алтаря == 1:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			Global.число_роз_у_алтаря -= 1
			$"Цветок 2/Роза 2".visible = true
			$"Цветок 2/Area2D Цветок 2".visible = false
			$Timer.wait_time = 3.7
			$Timer.start()
			Global.роза_2_взята = true
			Global.запустить_короткую_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			Роза_2.global_position = Vector2 (1100, 600)


func _on_area_2d_цветок_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.число_роз_у_алтаря == 5:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow I hope this is what Brynn wants.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow! I hope this is what\nBrynn wants."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой! Надеюсь это то,\nчто хочет Брин."
			elif Global.число_роз_у_алтаря == 4:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Nasty thorns.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Nasty thorns!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Противные шипы!"
			elif Global.число_роз_у_алтаря == 3:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			elif Global.число_роз_у_алтаря == 2:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/I'll take a whole bouquet.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "I'll take a whole bouquet."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Я возьму целый букет."
			elif Global.число_роз_у_алтаря == 1:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			Global.число_роз_у_алтаря -= 1
			$"Цветок 3/Роза 3".visible = true
			$"Цветок 3/Area2D Цветок 3".visible = false
			$Timer.wait_time = 3.7
			$Timer.start()
			Global.роза_3_взята = true
			Global.запустить_короткую_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			Роза_3.global_position = Vector2 (1300, 600)


func _on_area_2d_цветок_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.число_роз_у_алтаря == 5:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow I hope this is what Brynn wants.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow! I hope this is what\nBrynn wants."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой! Надеюсь это то,\nчто хочет Брин."
			elif Global.число_роз_у_алтаря == 4:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Nasty thorns.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Nasty thorns!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Противные шипы!"
			elif Global.число_роз_у_алтаря == 3:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			elif Global.число_роз_у_алтаря == 2:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/I'll take a whole bouquet.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "I'll take a whole bouquet."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Я возьму целый букет."
			elif Global.число_роз_у_алтаря == 1:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			Global.число_роз_у_алтаря -= 1
			$"Цветок 4/Роза 4".visible = true
			$"Цветок 4/Area2D Цветок 4".visible = false
			$Timer.wait_time = 3.7
			$Timer.start()
			Global.роза_4_взята = true
			Global.запустить_короткую_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			Роза_4.global_position = Vector2 (1500, 600)


func _on_area_2d_цветок_5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.число_роз_у_алтаря == 5:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow I hope this is what Brynn wants.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow! I hope this is what\nBrynn wants."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой! Надеюсь это то,\nчто хочет Брин."
			elif Global.число_роз_у_алтаря == 4:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Nasty thorns.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Nasty thorns!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Противные шипы!"
			elif Global.число_роз_у_алтаря == 3:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			elif Global.число_роз_у_алтаря == 2:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/I'll take a whole bouquet.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "I'll take a whole bouquet."
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Я возьму целый букет."
			elif Global.число_роз_у_алтаря == 1:
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload("res://Scenes/Scene 12/Ow.mp3")
				Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
				if Global.язык_игры == "en":
					текст_Брэндона.text = "Ow!"
				elif Global.язык_игры == "ru":
					текст_Брэндона.text = "Ой!"
			Global.число_роз_у_алтаря -= 1
			$"Цветок 5/Роза 5".visible = true
			$"Цветок 5/Area2D Цветок 5".visible = false
			$Timer.wait_time = 3.7
			$Timer.start()
			Global.роза_5_взята = true
			Global.запустить_короткую_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			Роза_5.global_position = Vector2 (1300, 700)
			

func _on_timer_timeout() -> void:
	if текст_Брэндона.text == "Hey! Perfect fit!" or текст_Брэндона.text == "Эй! Идеально подходит!":
		текст_Брэндона.text = "" 
		$Timer.wait_time = 1.8
		$Timer.start()
		#второе_сообщение_Брэндона = true
		номер_сообщения_брэндона_при_установке_мрамора = 2
	elif номер_сообщения_брэндона_при_установке_мрамора == 2:#второе_сообщение_Брэндона == true:
		#второе_сообщение_Брэндона = false
		$"AudioStreamPlayer диалоги Брендона".stream = preload("res://Scenes/Scene 12/Must be fixed now.mp3")
		$"AudioStreamPlayer диалоги Брендона".play()
		if Global.язык_игры == "en":
			текст_Брэндона.text = "Must be fixed now!"
		elif Global.язык_игры == "ru":
			текст_Брэндона.text = "Теперь должно работать!"
		Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
		$Timer.wait_time = 2.0
		$Timer.start()
		номер_сообщения_брэндона_при_установке_мрамора = 3
	elif номер_сообщения_брэндона_при_установке_мрамора == 3:
		текст_Брэндона.text = "" 
		Global.заблокировать_ввод = false
		Global.is_moving = true
		номер_сообщения_брэндона_при_установке_мрамора = 0
		$Timer.stop()
	

func _on_animated_sprite_2d_алтарь_установка_мрамора_animation_finished() -> void:
	$"Алтарь починен".visible = true
	Global.алтарь_починен = true
	$"AnimatedSprite2D Алтарь установка мрамора".visible = false
	$Timer.wait_time = 2.7
	$Timer.start()
	
	$"AudioStreamPlayer диалоги Брендона".stream = preload("res://Scenes/Scene 12/Hey Perfect fit.mp3")
	$"AudioStreamPlayer диалоги Брендона".play()
	Global.запустить_длинную_анимацию_разговора_Брэндона = true
	Global.текст_брэндона_изменился = true
	if Global.язык_игры == "en":
		текст_Брэндона.text = "Hey! Perfect fit!"
	elif Global.язык_игры == "ru":
		текст_Брэндона.text = "Эй! Идеально подходит!"


func _on_animated_sprite_2d_активация_белой_розы_animation_finished() -> void:
	$"AudioStreamPlayer новая музыка в игре".play()
	$"AnimatedSprite2D Получение амулета вторая часть анимации".visible = true
	$"AnimatedSprite2D Получение амулета вторая часть анимации".play("default")
	
func _on_animated_sprite_2d_получение_амулета_вторая_часть_анимации_animation_finished() -> void:
	$"AnimatedSprite2D Получение амулета вторая часть анимации".visible = false
	$"AnimatedSprite2D Получение амулета третья часть анимации".visible = true
	$"AnimatedSprite2D Получение амулета третья часть анимации".play("default")
	
	
func _on_animated_sprite_2d_получение_амулета_третья_часть_анимации_animation_finished() -> void:
	$"AnimatedSprite2D Получение амулета третья часть анимации".visible = false
	Global.сделать_амулет_в_инвентаре_видимым = true
	
	
func _on_audio_stream_player_превращение_розы_в_амулет_finished() -> void:
	Global.запустить_длинную_анимацию_разговора_Брэндона = true
	Global.текст_брэндона_изменился = true
	_on_timer_для_диалога_брэндона_после_получения_амулета_timeout()
	
func _on_timer_для_диалога_брэндона_после_получения_амулета_timeout() -> void:
	if номер_сообщения == 1:
		$"AudioStreamPlayer диалог брэндона после получения амулета".play()
		if Global.язык_игры == "en":
			текст_Брэндона.text = "Wow!"
		elif Global.язык_игры == "ru":
			текст_Брэндона.text = "Вау!"
		$"Timer для диалога Брэндона после получения амулета".wait_time = 1.4
		$"Timer для диалога Брэндона после получения амулета".start()	
		номер_сообщения = 2
	elif номер_сообщения == 2:
		if Global.язык_игры == "en":
			текст_Брэндона.text = "That must be the amulet!"
		elif Global.язык_игры == "ru":
			текст_Брэндона.text = "Это, должно быть, амулет!"
		$"Timer для диалога Брэндона после получения амулета".wait_time = 2.3
		$"Timer для диалога Брэндона после получения амулета".start()
		номер_сообщения = 3
	elif номер_сообщения == 3:
		if Global.язык_игры == "en":
			текст_Брэндона.text = "Hey, this is going\nto be easy!"
		elif Global.язык_игры == "ru":
			текст_Брэндона.text = "Эй, это было легко!"
		$"Timer для диалога Брэндона после получения амулета".wait_time = 2.1
		$"Timer для диалога Брэндона после получения амулета".start()	
		номер_сообщения = 4
	elif номер_сообщения == 4:
		текст_Брэндона.text = ""
		#номер_сообщения = 5
		#Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
		Global.заблокировать_ввод = false
		Global.is_moving = true
