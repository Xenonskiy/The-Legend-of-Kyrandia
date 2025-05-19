extends Sprite2D

var номер_фразы_Брэндона: int = 1


var cursor_strelka_left = preload("res://Assets/Cursors/Cursor_1_Left.png")

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.номер_сцены = 6
	if Global.предыдущий_номер_сцены == 5:
		Global.нижний_бордер_активный = false
	
	if 6 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(6)
	
	if Global.предыдущий_номер_сцены == 7:
		Global.поменять_музыку = true
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Храм Кирандии"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "The Temple of Kyrandia"
	
	
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = true
	

func _on_area_2d_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		Input.set_custom_mouse_cursor(cursor_strelka_left)
		if Global.item_взял == true:
			Global.нельзя_положить_предмет = true
			Global.item_там_где_меняется_курсор = true
			Global.взятый_предмет.get_node("Sprite2D").visible = false

func _on_area_2d_mouse_exited() -> void:
	Global.нельзя_положить_предмет = false
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.item_взял == false:
			Input.set_custom_mouse_cursor(null)
		else:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = false
			Global.взятый_предмет.get_node("Sprite2D").visible = true
		
func _on_area_2d_body_entered(player):
	Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_7 = true
		
		
func _process(delta: float) -> void:
	if Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации == false:
		if Global.предыдущий_номер_сцены == 7 and Global.player.global_position == Vector2(1200, 400):  
			Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = true
			if Global.при_выходе_из_храма_брэндон_должен_произнести_фразу == 1 or Global.при_выходе_из_храма_брэндон_должен_произнести_фразу == 2:
				_on_timer_время_до_появления_сообщения_при_входе_в_сцену_timeout()
	
	
	if Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_7 == true and Global.кликнул_в_сцене6_во_вход_в_храм == true and Global.заблокировать_ввод == false and Global.is_moving == true:
		Global.кликнул_в_сцене6_во_вход_в_храм = false
		Global.номер_сцены = 7
		Global.предыдущий_номер_сцены = 6
		Global.заблокировать_ввод = false
		Global.is_moving = true
		Global.scene_changed = true
		

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Global.нельзя_положить_предмет == false:
			Global.кликнул_в_сцене6_во_вход_в_храм = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_7 = false
	

func _on_timer_время_до_появления_сообщения_при_входе_в_сцену_timeout() -> void:
	if Global.при_выходе_из_храма_брэндон_должен_произнести_фразу == 1:
		if номер_фразы_Брэндона == 1:
			Global.запустить_длинную_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload ("res://Scenes/Scene 6/She wants me to get flowers.mp3")
			Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
			if Global.язык_игры == "en":
				Global.текст_брэндона.text = "She wants me to\nget flowers?!"
			elif Global.язык_игры == "ru":
				Global.текст_брэндона.text = "Она хочет,\nчтобы я достал цветы?!"
			$"Timer время до появления сообщения при входе в сцену".wait_time = 5.1
			$"Timer время до появления сообщения при входе в сцену".start()
			$"Timer длительность отображения сообщения при входе в сцену".wait_time = 3.2
			$"Timer длительность отображения сообщения при входе в сцену".start()
			номер_фразы_Брэндона = 2
		elif номер_фразы_Брэндона == 2:
			if Global.язык_игры == "en":
				Global.текст_брэндона.text = "Grandfather is rock!"
			elif Global.язык_игры == "ru":
				Global.текст_брэндона.text = "Деда превратили в камень!"
			$"Timer время до появления сообщения при входе в сцену".wait_time = 3.1
			$"Timer время до появления сообщения при входе в сцену".start()
			$"Timer длительность отображения сообщения при входе в сцену".wait_time = 2.7
			$"Timer длительность отображения сообщения при входе в сцену".start()
			номер_фразы_Брэндона = 3
		elif номер_фразы_Брэндона == 3:
			if Global.язык_игры == "en":
				Global.текст_брэндона.text = "He needs help, not\nsympathy!"
			elif Global.язык_игры == "ru":
				Global.текст_брэндона.text = "Ему нужна помощь,\nа не сочувствие!"
			$"Timer длительность отображения сообщения при входе в сцену".wait_time = 4.0
			$"Timer длительность отображения сообщения при входе в сцену".start()
			Global.при_выходе_из_храма_брэндон_должен_произнести_фразу = 0
			Global.сцена_4_номер_сообщения_которое_говорит_Брэндон_при_входе_в_локацию = 2
			номер_фразы_Брэндона = 4
			
		
		
		
	elif Global.при_выходе_из_храма_брэндон_должен_произнести_фразу == 2:
		if номер_фразы_Брэндона == 1:
			Global.запустить_короткую_анимацию_разговора_Брэндона = true
			Global.текст_брэндона_изменился = true
			Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.stream = preload ("res://Scenes/Scene 6/Amulet What Amulet.mp3")
			Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации.play()
			if Global.язык_игры == "en":
				Global.текст_брэндона.text = "Amulet? What Amulet?"
			elif Global.язык_игры == "ru":
				Global.текст_брэндона.text = "Амулет? Какой Амулет?"
			$"Timer длительность отображения сообщения при входе в сцену".wait_time = 3.2
			$"Timer длительность отображения сообщения при входе в сцену".start()
			Global.при_выходе_из_храма_брэндон_должен_произнести_фразу = 0
			
		


func _on_timer_длительность_отображения_сообщения_при_входе_в_сцену_timeout() -> void:
	Global.текст_брэндона.text = ""
	
		
