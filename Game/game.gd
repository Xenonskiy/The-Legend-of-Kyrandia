extends Node2D

var cursor_strelka_left = preload("res://Assets/Cursors/Cursor_1_Left.png")
var cursor_strelka_right = preload("res://Assets/Cursors/Cursor_1_Right.png")
var cursor_strelka_up = preload("res://Assets/Cursors/Cursor_1_Up.png")
var cursor_strelka_down = preload("res://Assets/Cursors/Cursor_1_Down.png")
var cursor_2 = preload("res://Assets/Cursors/Cursor_2.png")

func _ready():
	Global.текстовое_поле_под_игровым_окном = $"Текстовое поле под игровым окном"
	Global.текст_брэндона = $"player/Текст Брэндона"
	# Автоматическое создание обратного словаря
	for key in Global.словарь:
		Global.обратный_словарь[Global.словарь[key]] = key
	
	Global.игра_запущена = true
	Global.спаун_сцены = load("res://Scenes/Scene 1/scene_1.tscn").instantiate()
	add_child(Global.спаун_сцены)
	запустить_музыку()
	
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_key_m"):  # Открыть карту можно нажав клавишу M
		if Global.карта_включена == false:
			Global.карта_включена = true
			открыть_карту()
		else:
			Global.карта_включена = false
			закрыть_карту()
	
	if Input.is_action_just_pressed("ui_cancel"): # Открыть меню игры, нажав клавишу Esc
		Global.меню_игры_открылось = true
		$"Главное меню".visible = true
		Input.set_custom_mouse_cursor(null)
	
	if Global.текст_брэндона_изменился == true:
		$"player/Текст Брэндона/Timer".start()
		
	if Global.поменять_музыку == true:
		запустить_музыку()
	
	if Global.scene_changed == true:
		# Сделать видимыми предметы, если перешел в локацию, где их оставил или если предмет в инвентаре (это значение 1000)
		if Global.номер_сцены_в_которой_находится_записка_брин == Global.номер_сцены:
			$"Итемы/Записка Брин".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_записка_брин == 1010:
			$"Итемы/Записка Брин".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_записка_брин == 1020:
			$"Итемы/Записка Брин".visible = true
		else:
			$"Итемы/Записка Брин".visible = false
			
		if Global.номер_сцены_в_которой_находится_гранат == Global.номер_сцены:
			$"Итемы/Гранат".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_гранат == 1010:
			$"Итемы/Гранат".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_гранат == 1020:
			$"Итемы/Гранат".visible = true
		else:
			$"Итемы/Гранат".visible = false
			
		if Global.номер_сцены_в_которой_находится_пила == Global.номер_сцены:
			$"Итемы/Пила".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_пила == 1010:
			$"Итемы/Пила".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_пила == 1020:
			$"Итемы/Пила".visible = true
		else:
			$"Итемы/Пила".visible = false
			
		if Global.номер_сцены_в_которой_находится_яблоко == Global.номер_сцены:
			$"Итемы/Яблоко".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_яблоко == 1010:
			$"Итемы/Яблоко".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_яблоко == 1020:
			$"Итемы/Яблоко".visible = true
		else:
			$"Итемы/Яблоко".visible = false
			
		
		# Движение игрока, после смены локации
		if Global.номер_сцены == 1:
			# Первая координата передающаяся в функцию - это $player.position - координата в которой игрок появляется
			# Вторая координата - это Global.target_position - координата в которую игрок будет идти
			движение_игрока_после_смены_локации(Vector2(872, 700), Vector2(871, 550)) 
		elif Global.номер_сцены == 2 and Global.предыдущий_номер_сцены == 1:
			движение_игрока_после_смены_локации(Vector2(1032, 330), Vector2(1030, 430)) 
		elif Global.номер_сцены == 3 and Global.предыдущий_номер_сцены == 2:
			движение_игрока_после_смены_локации(Vector2(1400, 560), Vector2(1400, 560)) 
		elif (Global.номер_сцены == 3 and Global.предыдущий_номер_сцены == 4) or (Global.номер_сцены == 4 and Global.предыдущий_номер_сцены == 5):
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 4 and Global.предыдущий_номер_сцены == 3:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 5 and Global.предыдущий_номер_сцены == 4:
			движение_игрока_после_смены_локации(Vector2(1730, 210), Vector2(1430, 210))
		elif Global.номер_сцены == 6 and Global.предыдущий_номер_сцены == 5:
			движение_игрока_после_смены_локации(Vector2(1200, 700), Vector2(1300, 420))
		elif Global.номер_сцены == 5 and Global.предыдущий_номер_сцены == 6:
			движение_игрока_после_смены_локации(Vector2(1000, 0), Vector2(900, 300))
		elif Global.номер_сцены == 7:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1520, 560))
		elif Global.номер_сцены == 6 and Global.предыдущий_номер_сцены == 7:
			движение_игрока_после_смены_локации(Vector2(1000, 400), Vector2(1200, 400))
		elif Global.номер_сцены == 8 and Global.предыдущий_номер_сцены == 3:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 3 and Global.предыдущий_номер_сцены == 8:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 9 and Global.предыдущий_номер_сцены == 8:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 8 and Global.предыдущий_номер_сцены == 9:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 10 and Global.предыдущий_номер_сцены == 9:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 9 and Global.предыдущий_номер_сцены == 10:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 11 and Global.предыдущий_номер_сцены == 10:
			движение_игрока_после_смены_локации(Vector2(1200, 700), Vector2(1300, 420))
		elif Global.номер_сцены == 10 and Global.предыдущий_номер_сцены == 11:
			движение_игрока_после_смены_локации(Vector2(1000, 0), Vector2(900, 300))
		elif Global.номер_сцены == 12 and Global.предыдущий_номер_сцены == 11:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 11 and Global.предыдущий_номер_сцены == 12:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 13:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 12 and Global.предыдущий_номер_сцены == 13:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 14:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 11 and Global.предыдущий_номер_сцены == 14:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 10 and Global.предыдущий_номер_сцены == 15:
			движение_игрока_после_смены_локации(Vector2(1200, 700), Vector2(1300, 420))
		elif Global.номер_сцены == 15 and Global.предыдущий_номер_сцены == 10:
			движение_игрока_после_смены_локации(Vector2(1000, 0), Vector2(900, 300))
		elif Global.номер_сцены == 15 and Global.предыдущий_номер_сцены == 16:
			движение_игрока_после_смены_локации(Vector2(1200, 700), Vector2(1300, 420))
		elif Global.номер_сцены == 16 and Global.предыдущий_номер_сцены == 15:
			движение_игрока_после_смены_локации(Vector2(1000, 0), Vector2(900, 300))
		elif Global.номер_сцены == 17 and Global.предыдущий_номер_сцены == 16:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 16 and Global.предыдущий_номер_сцены == 17:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 18 and Global.предыдущий_номер_сцены == 17:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 17 and Global.предыдущий_номер_сцены == 18:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 19 and Global.предыдущий_номер_сцены == 18:
			движение_игрока_после_смены_локации(Vector2(1730, 560), Vector2(1550, 560))
		elif Global.номер_сцены == 18 and Global.предыдущий_номер_сцены == 19:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		
		
		# Сбрасываем текущий курсор перед сменой сцены
		Input.set_custom_mouse_cursor(null)
		
		if Global.item_взял == true:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
			
		Global.спаун_сцены.queue_free()
		Global.спаун_сцены = null
		Global.спаун_сцены = load("res://Scenes/Scene %d/scene_%d.tscn" % [Global.номер_сцены, Global.номер_сцены]).instantiate()
		add_child(Global.спаун_сцены)
		
		Global.scene_changed = false
		
	if Global.item_взял == true:
		Global.is_moving = false
		Global.взятый_предмет.position = get_global_mouse_position() - Global.взятый_предмет.get_node("Sprite2D").texture.get_size() * Global.взятый_предмет.get_node("Sprite2D").scale / 2
		
# Изменяем курсор, когда он входит в области Area2D_Left
func _on_area_2d_left_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.cursor_strelka_left == true:
			Input.set_custom_mouse_cursor(cursor_strelka_left)
		else:
			Input.set_custom_mouse_cursor(cursor_2)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = true
			Global.взятый_предмет.get_node("Sprite2D").visible = false
			
# Возвращаем стандартный курсор, когда он выходит из областей Area2D_Left
func _on_area_2d_left_mouse_exited() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.item_взял == false:
			Input.set_custom_mouse_cursor(null)
		else:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = false
			Global.взятый_предмет.get_node("Sprite2D").visible = true
		
# Изменяем курсор, когда он входит в области Area2D_Right
func _on_area_2d_right_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.cursor_strelka_right == true:
			Input.set_custom_mouse_cursor(cursor_strelka_right)
		else:
			Input.set_custom_mouse_cursor(cursor_2)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = true
			Global.взятый_предмет.get_node("Sprite2D").visible = false

# Возвращаем стандартный курсор, когда он выходит из областей Area2D_Right
func _on_area_2d_right_mouse_exited() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.item_взял == false:
			Input.set_custom_mouse_cursor(null)
		else:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = false
			Global.взятый_предмет.get_node("Sprite2D").visible = true
		
# Изменяем курсор, когда он входит в области Area2D_Up
func _on_area_2d_up_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.cursor_strelka_up == true:
			Input.set_custom_mouse_cursor(cursor_strelka_up)
		else:
			Input.set_custom_mouse_cursor(cursor_2)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = true
			Global.взятый_предмет.get_node("Sprite2D").visible = false

# Возвращаем стандартный курсор, когда он выходит из областей Area2D_Up
func _on_area_2d_up_mouse_exited() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.item_взял == false:
			Input.set_custom_mouse_cursor(null)
		else:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = false
			Global.взятый_предмет.get_node("Sprite2D").visible = true
		
# Изменяем курсор, когда он входит в области Area2D_Down
func _on_area_2d_down_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.cursor_strelka_down == true:
			Input.set_custom_mouse_cursor(cursor_strelka_down)
		else:
			Input.set_custom_mouse_cursor(cursor_2)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = true
			Global.взятый_предмет.get_node("Sprite2D").visible = false

# Возвращаем стандартный курсор, когда он выходит из областей Area2D_Down
func _on_area_2d_down_mouse_exited() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.item_взял == false:
			Input.set_custom_mouse_cursor(null)
		else:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = false
			Global.взятый_предмет.get_node("Sprite2D").visible = true

# Если не было заставки с деревом, Брэндон идет в нужную координату и начинается заставка
func _on_area_2d_down_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.была_заставка_с_деревом == false:
				Global.target_position = Vector2(1124, 556)
				
###################################    Кнопка Закрыть карту     ##################################

func _on_кнопка_закрыть_карту_pressed() -> void:
	закрыть_карту()
		
##################################################################################################

func _on_area_2d_left_body_entered(body: Node2D) -> void:
	if Global.карта_включена == false and Global.левый_бордер_активный == true:
		if Global.номер_сцены == 3:
			Global.номер_сцены = 4
			Global.предыдущий_номер_сцены = 3
			Global.scene_changed = true
		elif Global.номер_сцены == 4:
			Global.номер_сцены = 5
			Global.предыдущий_номер_сцены = 4
			Global.scene_changed = true
		elif Global.номер_сцены == 8:
			Global.номер_сцены = 3
			Global.предыдущий_номер_сцены = 8
			Global.scene_changed = true
		elif Global.номер_сцены == 9:
			Global.номер_сцены = 8
			Global.предыдущий_номер_сцены = 9
			Global.scene_changed = true
		elif Global.номер_сцены == 10:
			Global.номер_сцены = 9
			Global.предыдущий_номер_сцены = 10
			Global.scene_changed = true
		elif Global.номер_сцены == 12:
			Global.номер_сцены = 11
			Global.предыдущий_номер_сцены = 12
			Global.scene_changed = true
		elif Global.номер_сцены == 13:
			Global.номер_сцены = 12
			Global.предыдущий_номер_сцены = 13
			Global.scene_changed = true
		elif Global.номер_сцены == 11:
			Global.номер_сцены = 14
			Global.предыдущий_номер_сцены = 11
			Global.scene_changed = true
		elif Global.номер_сцены == 16:
			Global.номер_сцены = 17
			Global.предыдущий_номер_сцены = 16
			Global.scene_changed = true
		elif Global.номер_сцены == 17:
			Global.номер_сцены = 18
			Global.предыдущий_номер_сцены = 17
			Global.scene_changed = true
		elif Global.номер_сцены == 18:
			Global.номер_сцены = 19
			Global.предыдущий_номер_сцены = 18
			Global.scene_changed = true
		
			
func _on_area_2d_left_body_exited(player):
	Global.левый_бордер_активный = true

func _on_area_2d_right_body_entered(body: Node2D) -> void:
	if Global.карта_включена == false and Global.правый_бордер_активный == true:
		if Global.номер_сцены == 3:
			Global.номер_сцены = 8
			Global.предыдущий_номер_сцены = 3
			Global.scene_changed = true
		elif Global.номер_сцены == 4:
			Global.номер_сцены = 3
			Global.предыдущий_номер_сцены = 4
			Global.scene_changed = true
		elif Global.номер_сцены == 5:
			Global.номер_сцены = 4
			Global.предыдущий_номер_сцены = 5
			Global.scene_changed = true
		elif Global.номер_сцены == 7:
			Global.номер_сцены = 6
			Global.предыдущий_номер_сцены = 7
			Global.scene_changed = true
		elif Global.номер_сцены == 8:
			Global.номер_сцены = 9
			Global.предыдущий_номер_сцены = 8
			Global.scene_changed = true
		elif Global.номер_сцены == 9:
			Global.номер_сцены = 10
			Global.предыдущий_номер_сцены = 9
			Global.scene_changed = true
		elif Global.номер_сцены == 11:
			Global.номер_сцены = 12
			Global.предыдущий_номер_сцены = 11
			Global.scene_changed = true
		elif Global.номер_сцены == 12:
			Global.номер_сцены = 13
			Global.предыдущий_номер_сцены = 12
			Global.scene_changed = true
		elif Global.номер_сцены == 14:
			Global.номер_сцены = 11
			Global.предыдущий_номер_сцены = 14
			Global.scene_changed = true
		elif Global.номер_сцены == 17:
			Global.номер_сцены = 16
			Global.предыдущий_номер_сцены = 17
			Global.scene_changed = true
		elif Global.номер_сцены == 18:
			Global.номер_сцены = 17
			Global.предыдущий_номер_сцены = 18
			Global.scene_changed = true
		elif Global.номер_сцены == 19:
			Global.номер_сцены = 18
			Global.предыдущий_номер_сцены = 19
			Global.scene_changed = true
					
func _on_area_2d_right_body_exited(player):
	Global.правый_бордер_активный = true

func _on_area_2d_up_body_entered(player):
	if Global.карта_включена == false and Global.верхний_бордер_активный == true:
		if Global.номер_сцены == 3:
			Global.номер_сцены = 2
			Global.предыдущий_номер_сцены = 3
			Global.scene_changed = true
		elif Global.номер_сцены == 5:
			Global.номер_сцены = 6
			Global.предыдущий_номер_сцены = 5
			Global.scene_changed = true
		elif Global.номер_сцены == 10:
			Global.номер_сцены = 11
			Global.предыдущий_номер_сцены = 10
			Global.scene_changed = true
		elif Global.номер_сцены == 15:
			Global.номер_сцены = 10
			Global.предыдущий_номер_сцены = 15
			Global.scene_changed = true
		elif Global.номер_сцены == 16:
			Global.номер_сцены = 15
			Global.предыдущий_номер_сцены = 16
			Global.scene_changed = true
					
func _on_area_2d_up_body_exited(player):
	Global.верхний_бордер_активный = true
		
func _on_area_2d_down_body_entered(player):
	if Global.карта_включена == false and Global.нижний_бордер_активный == true:
		if Global.номер_сцены == 1:
			Global.номер_сцены = 2
			Global.предыдущий_номер_сцены = 1
			Global.scene_changed = true
		elif Global.номер_сцены == 2:
			Global.номер_сцены = 3
			Global.предыдущий_номер_сцены = 2
			Global.scene_changed = true
		elif Global.номер_сцены == 6:
			Global.номер_сцены = 5
			Global.предыдущий_номер_сцены = 6
			Global.scene_changed = true
		elif Global.номер_сцены == 11:
			Global.номер_сцены = 10
			Global.предыдущий_номер_сцены = 11
			Global.scene_changed = true
		elif Global.номер_сцены == 10:
			Global.номер_сцены = 15
			Global.предыдущий_номер_сцены = 10
			Global.scene_changed = true
		elif Global.номер_сцены == 15:
			Global.номер_сцены = 16
			Global.предыдущий_номер_сцены = 15
			Global.scene_changed = true
					
func _on_area_2d_down_body_exited(player):
	Global.нижний_бордер_активный = true
			
###################################    Функция запуска музыки     ################################
func запустить_музыку():
	# Если музыка уже играет, сохранить текущую позицию
	if $AudioStreamPlayer.playing:
		Global.текущая_секунда_музыки = $AudioStreamPlayer.get_playback_position()
	else:
		Global.текущая_секунда_музыки = 0.0

	# Проверяем, изменился ли номер сцены
	if Global.номер_сцены != Global.предыдущий_номер_сцены_для_музыки:
		if Global.номер_сцены in [2, 3, 4, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16] and Global.предыдущий_номер_сцены_для_музыки in [2, 3, 4, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16]:
			# Сохраняем текущую позицию и продолжаем ту же музыку
			Global.текущая_секунда_музыки = $AudioStreamPlayer.get_playback_position()
		elif Global.номер_сцены in [18, 19] and Global.предыдущий_номер_сцены_для_музыки in [18, 19]:
			# Сохраняем текущую позицию и продолжаем ту же музыку
			Global.текущая_секунда_музыки = $AudioStreamPlayer.get_playback_position()
		else:
			# Обнуляем позицию, если сцена поменялась на другую
			Global.текущая_секунда_музыки = 0.0

		Global.предыдущий_номер_сцены_для_музыки = Global.номер_сцены  # Обновляем предыдущий номер сцены

	# Если сцена 1, не выбираем музыку
	if Global.номер_сцены == 1:
		$AudioStreamPlayer.stop()  # Останавливаем музыку, если она была
		return
	
	# Выбор трека в зависимости от сцены и настроек
	if (Global.номер_сцены == 2 or Global.номер_сцены == 3 or Global.номер_сцены == 4 or Global.номер_сцены == 5 or Global.номер_сцены == 6 or Global.номер_сцены == 8 or Global.номер_сцены == 10 or Global.номер_сцены == 11 or Global.номер_сцены == 12 or Global.номер_сцены == 13 or Global.номер_сцены == 14 or Global.номер_сцены == 15 or Global.номер_сцены == 16 ) and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/06 Оригинал Brandon's Home.mp3")
	elif (Global.номер_сцены == 2 or Global.номер_сцены == 3 or Global.номер_сцены == 4 or Global.номер_сцены == 5 or Global.номер_сцены == 6 or Global.номер_сцены == 8 or Global.номер_сцены == 10 or Global.номер_сцены == 11 or Global.номер_сцены == 12 or Global.номер_сцены == 13 or Global.номер_сцены == 14 or Global.номер_сцены == 15 or Global.номер_сцены == 16) and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/06 Улучшенная Brandon's Home.mp3")
	elif Global.номер_сцены == 7 and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/07 Оригинал The Temple of Kyrandia.mp3")
	elif Global.номер_сцены == 7 and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/07 Улучшенная The Temple of Kyrandia.mp3")
	elif Global.номер_сцены == 9 and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/09 Оригинал Pool of Sorrow.mp3")
	elif Global.номер_сцены == 9 and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/09 Улучшенная Pool of Sorrow.mp3")
	elif Global.номер_сцены == 17 and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/10 Оригинал Cave.mp3")
	elif Global.номер_сцены == 17 and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/10 Улучшенная Cave.mp3")
	elif (Global.номер_сцены == 18 or Global.номер_сцены == 19) and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/11 Оригинал Timbermist Woods.mp3")
	elif (Global.номер_сцены == 18 or Global.номер_сцены == 19) and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/11 Улучшенная Timbermist Woods.mp3")
		

	# Установка нового трека и воспроизведение с сохраненной позиции
	$AudioStreamPlayer.stream = Global.музыка
	$AudioStreamPlayer.play(Global.текущая_секунда_музыки)

	# Сброс флага изменения музыки
	Global.поменять_музыку = false

##################################################################################################

###################################    Вызывается меню игры     ##################################

func _on_touch_screen_button_pressed():
	Global.меню_игры_открылось = true
	$"Главное меню".visible = true
	Input.set_custom_mouse_cursor(null)
	
##########################      Кнопка инвентаря переключения 10 ячеек     ######################

func _on_кнопка_инвентаря_pressed() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.включил_вторые_10_ячеек = true
		# Скрываем предметы из первых 10 ячеек (1-10)
		for i in range(1, 11):  # 10 включительно
			var ячейка_занята = Global.get("ячейка_%d_занята" % i)
			var предмет = Global.get("ячейка_%d_предмет_в_ней" % i)
			if ячейка_занята and предмет:
				предмет.visible = false
		# Показываем предметы из вторых 10 ячеек (11-20)
		for i in range(11, 21):  # 20 включительно
			var ячейка_занята = Global.get("ячейка_%d_занята" % i)
			var предмет = Global.get("ячейка_%d_предмет_в_ней" % i)
			if ячейка_занята and предмет:
				предмет.visible = true
		
	else:
		Global.включил_вторые_10_ячеек = false
		# Скрываем предметы из вторых 10 ячеек (11-20)
		for i in range(11, 21):  # 20 включительно
			var ячейка_занята = Global.get("ячейка_%d_занята" % i)
			var предмет = Global.get("ячейка_%d_предмет_в_ней" % i)
			if ячейка_занята and предмет:
				предмет.visible = false
		# Показываем предметы из первых 10 ячеек (1-10)
		for i in range(1, 11):  # 10 включительно
			var ячейка_занята = Global.get("ячейка_%d_занята" % i)
			var предмет = Global.get("ячейка_%d_предмет_в_ней" % i)
			if ячейка_занята and предмет:
				предмет.visible = true



########################################### Предметы Итемы #######################################
##########################################   Записка Брин    #####################################

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false: 
		Global.номер_взятого_предмета = 1
		взять_или_положить_предмет()
				
#######################################   Гранат   ###############################################

func _on_area_2d_гранат_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false: 
		Global.номер_взятого_предмета = 2
		взять_или_положить_предмет()
		
#######################################   Пила   #################################################
		
func _on_area_2d_пила_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false: 
		Global.номер_взятого_предмета = 3
		взять_или_положить_предмет()

#######################################   Яблоко   ###############################################

func _on_area_2d_яблоко_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false: 
		Global.номер_взятого_предмета = 4
		взять_или_положить_предмет()
	
##################################################################################################
###################################      Ячейки инвентаря      ###################################
##################################################################################################
###################################             1           ######################################

func _on_area_2d_ячейка_1_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_1 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_11 = true
		
		
func _on_area_2d_ячейка_1_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_1 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_11 = false
		
###################################             2           ######################################

func _on_area_2d_ячейка_2_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_2 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_12 = true
		
func _on_area_2d_ячейка_2_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_2 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_12 = false

###################################             3           ######################################

func _on_area_2d_ячейка_3_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_3 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_13 = true
	
func _on_area_2d_ячейка_3_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_3 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_13 = false

###################################             4           ######################################

func _on_area_2d_ячейка_4_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_4 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_14 = true
		
func _on_area_2d_ячейка_4_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_4 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_14 = false
	
###################################             5           ######################################

func _on_area_2d_ячейка_5_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_5 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_15 = true
	
func _on_area_2d_ячейка_5_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_5 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_15 = false
	
###################################             6           ######################################

func _on_area_2d_ячейка_6_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_6 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_16 = true
	
func _on_area_2d_ячейка_6_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_6 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_16 = false
	
###################################             7           ######################################

func _on_area_2d_ячейка_7_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_7 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_17 = true
	
func _on_area_2d_ячейка_7_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_7 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_17 = false
	
###################################             8           ######################################

func _on_area_2d_ячейка_8_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_8 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_18 = true
	
func _on_area_2d_ячейка_8_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_8 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_18 = false

###################################             9           ######################################

func _on_area_2d_ячейка_9_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_9 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_19 = true
	
func _on_area_2d_ячейка_9_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_9 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_19 = false
	
###################################             10           #####################################

func _on_area_2d_ячейка_10_mouse_entered() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_10 = true
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_20 = true
	
func _on_area_2d_ячейка_10_mouse_exited() -> void:
	if Global.включил_вторые_10_ячеек == false:
		Global.курсор_вошел_в_ячейку_10 = false
	elif Global.включил_вторые_10_ячеек == true:
		Global.курсор_вошел_в_ячейку_20 = false

##################################################################################################



func _on_timer_timeout() -> void:
	Global.текст_брэндона_изменился = false
	Global.текст_брэндона.text = ""
	Global.target_position = $player.global_position # Если кликнуть в любом месте, когда есть текст Брэндона, после того как текст исчезнет, Брэндон останется на месте
	
	
###################################    Кнопка карты влево     ####################################

func _on_кнопка_карта_влево_pressed() -> void:
	var start: int = 0
	var end: int = 0
	
	if Global.отображаемая_карта == "Строевой лес":
		Global.отображаемая_карта = "Темный лес"
		if Global.язык_игры == "ru":
			$"CanvasLayer Закрыть карту/Название карты".text = "Тёмный лес"
		elif Global.язык_игры == "en":
			$"CanvasLayer Закрыть карту/Название карты".text = "Dark forest"
		start = 0  # Задается диапазон, какие номера карт станут видимы
		end = 17
		$"CanvasLayer Закрыть карту/Кнопка карта влево".visible = false
		$"CanvasLayer Закрыть карту/Кнопка карта вправо".visible = true
	else:
		return  # Если номер сцены 30 и выше, выход из функции
	
	# Сначала делаем все номера карт не видимыми
	for номер_сцены in Global.номера_сцен_в_которых_был_игрок:
		var путь = "Карта/" + str(номер_сцены)  # Создаем строковый путь
		var узел = get_node_or_null(путь)
		if узел:
			узел.visible = false
			
	# Теперь делаем видимыми только те номера карт, которые в диапазоне
	for номер_сцены in range(start, end + 1):
		if номер_сцены in Global.номера_сцен_в_которых_был_игрок:
			var путь = "Карта/" + str(номер_сцены)  # Создаем строковый путь
			var узел = get_node_or_null(путь)
			if узел:
				узел.visible = true
				
###################################    Кнопка карты вправо    ####################################

func _on_кнопка_карта_вправо_pressed() -> void:
	var start: int = 0
	var end: int = 0
	var found = false
	
	for number in Global.номера_сцен_в_которых_был_игрок:
		if number >= 17:
			found = true
			break
	
	if Global.отображаемая_карта == "Темный лес" and found == true:
		Global.отображаемая_карта = "Строевой лес"
		if Global.язык_игры == "ru":
			$"CanvasLayer Закрыть карту/Название карты".text = "Строевой лес"
		elif Global.язык_игры == "en":
			$"CanvasLayer Закрыть карту/Название карты".text = "The Timbermist Woods"
		start = 18  # Задается диапазон, какие номера карт станут видимы
		end = 30
		$"CanvasLayer Закрыть карту/Кнопка карта влево".visible = true
		$"CanvasLayer Закрыть карту/Кнопка карта вправо".visible = false
	else:
		return  # Если номер сцены 30 и выше, выход из функции
	
	# Сначала делаем все номера карт не видимыми
	for номер_сцены in Global.номера_сцен_в_которых_был_игрок:
		var путь = "Карта/" + str(номер_сцены)  # Создаем строковый путь
		var узел = get_node_or_null(путь)
		if узел:
			узел.visible = false
			
	# Теперь делаем видимыми только те номера карт, которые в диапазоне
	for номер_сцены in range(start, end + 1):
		if номер_сцены in Global.номера_сцен_в_которых_был_игрок:
			var путь = "Карта/" + str(номер_сцены)  # Создаем строковый путь
			var узел = get_node_or_null(путь)
			if узел:
				узел.visible = true

##################################################################################################


#########################    Функция движения игрока, после смены локации    #####################

func движение_игрока_после_смены_локации(player_position: Vector2, target_position: Vector2) -> void:
	Global.is_moving = false
	$player.position = player_position
	Global.target_position = target_position
	Global.is_moving = true
	$player.update_idle_animation() 
	$player.is_moving_anim = false  # Сбрасываем флаг анимации движения
	
##################################################################################################


# Функция для обработки предметов
func взять_или_положить_предмет():
	if Global.item_взял == false:  # Предмет берется
		if Global.включил_вторые_10_ячеек == false:
			for i in range(1, 11):  # от 1 до 10 включительно
				if Global.get("курсор_вошел_в_ячейку_" + str(i)):
					Global.set("ячейка_" + str(i) + "_занята", false)
		elif Global.включил_вторые_10_ячеек == true:
			for i in range(11, 21):  # от 11 до 20 включительно
				if Global.get("курсор_вошел_в_ячейку_" + str(i)):
					Global.set("ячейка_" + str(i) + "_занята", false)
		Global.item_взял = true
		
		if Global.номер_взятого_предмета == 1:
			Global.взятый_предмет = $"Итемы/Записка Брин"
			Global.записка_брин_взял_со_стола = true
			$"Итемы/Записка Брин/Sprite2D".texture = preload("res://Assets/Items/Записка для Брин.png")
		elif Global.номер_взятого_предмета == 2:
			Global.взятый_предмет = $"Итемы/Гранат"
		elif Global.номер_взятого_предмета == 3:
			Global.взятый_предмет = $"Итемы/Пила"
			Global.пила_взял = true
			$"Итемы/Пила/Sprite2D".texture = preload("res://Assets/Items/Пила.png")
		elif Global.номер_взятого_предмета == 4:
			Global.взятый_предмет = $"Итемы/Яблоко"
			$"Итемы/Яблоко/Sprite2D".texture = preload("res://Assets/Items/Яблоко.png")
			
	elif Global.item_взял == true: # Предмет отпускается
		# Предмет отпускается в игровом окне
		if Global.взятый_предмет.global_position.y <= 630 and Global.взятый_предмет.global_position.x > 45 and Global.взятый_предмет.global_position.x < 1555 and Global.взятый_предмет.global_position.y > 45:    
			Global.item_взял = false
			Global.взятый_предмет = null
			
			if Global.номер_взятого_предмета == 1:
				Global.номер_сцены_в_которой_находится_записка_брин = Global.номер_сцены
			elif Global.номер_взятого_предмета == 2:
				Global.номер_сцены_в_которой_находится_гранат = Global.номер_сцены
			elif Global.номер_взятого_предмета == 3:
				Global.номер_сцены_в_которой_находится_пила = Global.номер_сцены
			elif Global.номер_взятого_предмета == 4:
				Global.номер_сцены_в_которой_находится_яблоко = Global.номер_сцены
				
		# Предмет отпускается в ячейки
		elif Global.включил_вторые_10_ячеек == false:
			if Global.курсор_вошел_в_ячейку_1 == true:
				if Global.ячейка_1_занята == false:
					Global.item_взял = false
					Global.ячейка_1_занята = true
					Global.взятый_предмет.global_position = Vector2 (500, 839)
					Global.ячейка_1_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_2 == true:
				if Global.ячейка_2_занята == false:
					Global.item_взял = false
					Global.ячейка_2_занята = true
					Global.взятый_предмет.global_position = Vector2 (605, 839)
					Global.ячейка_2_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_3 == true:
				if Global.ячейка_3_занята == false:
					Global.item_взял = false
					Global.ячейка_3_занята = true
					Global.взятый_предмет.global_position = Vector2 (710, 839)
					Global.ячейка_3_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_4 == true:
				if Global.ячейка_4_занята == false:
					Global.item_взял = false
					Global.ячейка_4_занята = true
					Global.взятый_предмет.global_position = Vector2 (815, 839)
					Global.ячейка_4_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_5 == true:
				if Global.ячейка_5_занята == false:
					Global.item_взял = false
					Global.ячейка_5_занята = true
					Global.взятый_предмет.global_position = Vector2 (920, 839)
					Global.ячейка_5_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_6 == true:
				if Global.ячейка_6_занята == false:
					Global.item_взял = false
					Global.ячейка_6_занята = true
					Global.взятый_предмет.global_position = Vector2 (500, 949)
					Global.ячейка_6_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_7 == true:
				if Global.ячейка_7_занята == false:
					Global.item_взял = false
					Global.ячейка_7_занята = true
					Global.взятый_предмет.global_position = Vector2 (605, 949)
					Global.ячейка_7_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_8 == true:
				if Global.ячейка_8_занята == false:
					Global.item_взял = false
					Global.ячейка_8_занята = true
					Global.взятый_предмет.global_position = Vector2 (710, 949)
					Global.ячейка_8_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_9 == true:
				if Global.ячейка_9_занята == false:
					Global.item_взял = false
					Global.ячейка_9_занята = true
					Global.взятый_предмет.global_position = Vector2 (815, 949)
					Global.ячейка_9_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_10 == true:
				if Global.ячейка_10_занята == false:
					Global.item_взял = false
					Global.ячейка_10_занята = true
					Global.взятый_предмет.global_position = Vector2 (920, 949)
					Global.ячейка_10_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
					
			if Global.номер_взятого_предмета == 1:
				Global.номер_сцены_в_которой_находится_записка_брин = 1010 # Положил в инвентарь, в первые 10 ячеек
			elif Global.номер_взятого_предмета == 2:
				Global.номер_сцены_в_которой_находится_гранат = 1010 # Положил в инвентарь, в первые 10 ячеек
			elif Global.номер_взятого_предмета == 3:
				Global.номер_сцены_в_которой_находится_пила = 1010
			elif Global.номер_взятого_предмета == 4:
				Global.номер_сцены_в_которой_находится_яблоко = 1010
				
		elif Global.включил_вторые_10_ячеек == true:
			if Global.курсор_вошел_в_ячейку_11 == true:
				if Global.ячейка_11_занята == false:
					Global.item_взял = false
					Global.ячейка_11_занята = true
					Global.взятый_предмет.global_position = Vector2 (500, 839)
					Global.ячейка_11_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_12 == true:
				if Global.ячейка_12_занята == false:
					Global.item_взял = false
					Global.ячейка_12_занята = true
					Global.взятый_предмет.global_position = Vector2 (605, 839)
					Global.ячейка_12_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_13 == true:
				if Global.ячейка_13_занята == false:
					Global.item_взял = false
					Global.ячейка_13_занята = true
					Global.взятый_предмет.global_position = Vector2 (710, 839)
					Global.ячейка_13_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_14 == true:
				if Global.ячейка_14_занята == false:
					Global.item_взял = false
					Global.ячейка_14_занята = true
					Global.взятый_предмет.global_position = Vector2 (815, 839)
					Global.ячейка_14_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_15 == true:
				if Global.ячейка_15_занята == false:
					Global.item_взял = false
					Global.ячейка_15_занята = true
					Global.взятый_предмет.global_position = Vector2 (920, 839)
					Global.ячейка_15_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_16 == true:
				if Global.ячейка_16_занята == false:
					Global.item_взял = false
					Global.ячейка_16_занята = true
					Global.взятый_предмет.global_position = Vector2 (500, 949)
					Global.ячейка_16_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_17 == true:
				if Global.ячейка_17_занята == false:
					Global.item_взял = false
					Global.ячейка_17_занята = true
					Global.взятый_предмет.global_position = Vector2 (605, 949)
					Global.ячейка_17_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_18 == true:
				if Global.ячейка_18_занята == false:
					Global.item_взял = false
					Global.ячейка_18_занята = true
					Global.взятый_предмет.global_position = Vector2 (710, 949)
					Global.ячейка_18_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_19 == true:
				if Global.ячейка_19_занята == false:
					Global.item_взял = false
					Global.ячейка_19_занята = true
					Global.взятый_предмет.global_position = Vector2 (815, 949)
					Global.ячейка_19_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
			elif Global.курсор_вошел_в_ячейку_20 == true:
				if Global.ячейка_20_занята == false:
					Global.item_взял = false
					Global.ячейка_20_занята = true
					Global.взятый_предмет.global_position = Vector2 (920, 949)
					Global.ячейка_20_предмет_в_ней = Global.взятый_предмет
					Global.взятый_предмет = null
					
			if Global.номер_взятого_предмета == 1:
				Global.номер_сцены_в_которой_находится_записка_брин = 1020 # Положил в инвентарь, во вторые 10 ячеек
			elif Global.номер_взятого_предмета == 2:
				Global.номер_сцены_в_которой_находится_гранат = 1020 # Положил в инвентарь, во вторые 10 ячеек
			elif Global.номер_взятого_предмета == 3:
				Global.номер_сцены_в_которой_находится_пила = 1020 
			elif Global.номер_взятого_предмета == 4:
				Global.номер_сцены_в_которой_находится_яблоко = 1020 


func открыть_карту():
	if Global.игра_запущена == true:
		Global.меню_игры_открылось = true # Чтобы игрок при закрытии карты не двигался
		$"Карта".visible = true
		$"CanvasLayer Закрыть карту".visible = true
		Global.карта_включена = true
		
		var start: int = 0
		var end: int = 0
		
		if Global.номер_сцены <= 17:
			Global.отображаемая_карта = "Темный лес"
			start = 0  # Задается диапазон, какие номера карт станут видимы
			end = 17
			$"CanvasLayer Закрыть карту/Кнопка карта влево".visible = false
			$"CanvasLayer Закрыть карту/Кнопка карта вправо".visible = false
			if Global.язык_игры == "ru":
				$"CanvasLayer Закрыть карту/Название карты".text = "Тёмный лес"
			elif Global.язык_игры == "en":
				$"CanvasLayer Закрыть карту/Название карты".text = "Dark forest"
			if 18 in Global.номера_сцен_в_которых_был_игрок:
				$"CanvasLayer Закрыть карту/Кнопка карта вправо".visible = true
		elif Global.номер_сцены > 17 and Global.номер_сцены < 30:
			Global.отображаемая_карта = "Строевой лес"
			$"CanvasLayer Закрыть карту/Название карты".text = "Строевой лес"
			$"CanvasLayer Закрыть карту/Кнопка карта влево".visible = true
			$"CanvasLayer Закрыть карту/Кнопка карта вправо".visible = false
			if Global.язык_игры == "ru":
				$"CanvasLayer Закрыть карту/Название карты".text = "Строевой лес"
			elif Global.язык_игры == "en":
				$"CanvasLayer Закрыть карту/Название карты".text = "The Timbermist Woods"
			start = 18  # Задается диапазон, какие номера карт станут видимы
			end = 30
		else:
			return  # Если номер сцены 30 и выше, выход из функции
			
		# Сначала делаем все номера карт не видимыми
		for номер_сцены in Global.номера_сцен_в_которых_был_игрок:
			var путь = "Карта/%d" % номер_сцены
			var узел = get_node_or_null(путь)
			if узел:
				узел.visible = false
		
		# Теперь делаем видимыми только те номера карт, которые в диапазоне
		for номер_сцены in range(start, end + 1):
			if номер_сцены in Global.номера_сцен_в_которых_был_игрок:
				var путь = "Карта/%d" % номер_сцены
				var узел = get_node_or_null(путь)
				if узел:
					узел.visible = true
					
func закрыть_карту():
	$"Главное меню".visible = false
	$"Карта".visible = false
	$"CanvasLayer Закрыть карту".visible = false
	Global.карта_включена = false
	Global.меню_игры_открылось = false
	#$"Итемы/StaticBody2D Записка Брин".visible = true
	if Global.item_взял == true:
		Input.set_custom_mouse_cursor(Global.cursor_with_item)
		
