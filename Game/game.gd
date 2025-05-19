extends Node2D

var Брэндон_пришел_в_позицию_перехода_в_другую_сцену = false

var счетчик_запустить_длинную_анимацию_разговора_Брэндона: int = 1
var номер_сообщения_Брэндона_после_смены_локации: int = 1
var последнее_сообщение_Брэндона_в_диалоге_после_смены_локации: bool = false

var cursor_strelka_left = preload("res://Assets/Cursors/Cursor_1_Left.png")
var cursor_strelka_right = preload("res://Assets/Cursors/Cursor_1_Right.png")
var cursor_strelka_up = preload("res://Assets/Cursors/Cursor_1_Up.png")
var cursor_strelka_down = preload("res://Assets/Cursors/Cursor_1_Down.png")
var cursor_2 = preload("res://Assets/Cursors/Cursor_2.png")

func _ready():
	Global.ссылка_на_AudioStreamPlayer_диалог_Брэндона_после_смены_локации = $"player/AudioStreamPlayer что говорит брэндон"
	Global.player = $player
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
	
	
	if Брэндон_пришел_в_позицию_перехода_в_другую_сцену == true:
		if Global.номер_сцены == 3:
			if Global.player.global_position == Vector2(2300, 516):
				Брэндон_пришел_в_позицию_перехода_в_другую_сцену = false
				#Global.заблокировать_ввод = false
				Global.номер_сцены = 8
				Global.предыдущий_номер_сцены = 3
				Global.scene_changed = true
		elif Global.номер_сцены == 8:
			if Global.player.global_position == Vector2(2300, 516):
				Брэндон_пришел_в_позицию_перехода_в_другую_сцену = false
				#Global.заблокировать_ввод = false
				Global.номер_сцены = 9
				Global.предыдущий_номер_сцены = 8
				Global.scene_changed = true
		elif Global.номер_сцены == 9:
			if Global.player.global_position == Vector2(2300, 516):
				Брэндон_пришел_в_позицию_перехода_в_другую_сцену = false
				#Global.заблокировать_ввод = false
				Global.номер_сцены = 10
				Global.предыдущий_номер_сцены = 9
				Global.scene_changed = true
	
	
	if Global.остановить_музыку == true:
		Global.остановить_музыку = false
		$AudioStreamPlayer.stop()
		
			
	if Global.запустить_музыку == true:
		Global.запустить_музыку = false
		$AudioStreamPlayer.play()
				
	if Global.сделать_амулет_в_инвентаре_видимым == true:
		Global.сделать_амулет_в_инвентаре_видимым = false
		$"Амулет".visible = true
	
	
	if Global.поменять_музыку == true:
		запустить_музыку()
	if Global.запустить_заставку_с_деревом == true:
		запустить_музыку()
		Global.запустить_заставку_с_деревом = false
	
	
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
			
			
		if Global.номер_сцены_в_которой_находится_слеза == Global.номер_сцены:
			$"Итемы/Слеза".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_слеза == 1010:
			$"Итемы/Слеза".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_слеза == 1020:
			$"Итемы/Слеза".visible = true
		else:
			$"Итемы/Слеза".visible = false
			
			
		if Global.номер_сцены_в_которой_находится_роза_1 == Global.номер_сцены:
			$"Итемы/Роза 1".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_роза_1 == 1010:
			$"Итемы/Роза 1".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_роза_1 == 1020:
			$"Итемы/Роза 1".visible = true
		else:
			$"Итемы/Роза 1".visible = false
			
			
		if Global.номер_сцены_в_которой_находится_роза_2 == Global.номер_сцены:
			$"Итемы/Роза 2".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_роза_2 == 1010:
			$"Итемы/Роза 2".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_роза_2 == 1020:
			$"Итемы/Роза 2".visible = true
		else:
			$"Итемы/Роза 2".visible = false
			
			
		if Global.номер_сцены_в_которой_находится_роза_3 == Global.номер_сцены:
			$"Итемы/Роза 3".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_роза_3 == 1010:
			$"Итемы/Роза 3".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_роза_3 == 1020:
			$"Итемы/Роза 3".visible = true
		else:
			$"Итемы/Роза 3".visible = false
			
			
		if Global.номер_сцены_в_которой_находится_роза_4 == Global.номер_сцены:
			$"Итемы/Роза 4".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_роза_4 == 1010:
			$"Итемы/Роза 4".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_роза_4 == 1020:
			$"Итемы/Роза 4".visible = true
		else:
			$"Итемы/Роза 4".visible = false
			
			
		if Global.номер_сцены_в_которой_находится_роза_5 == Global.номер_сцены:
			$"Итемы/Роза 5".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_роза_5 == 1010:
			$"Итемы/Роза 5".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_роза_5 == 1020:
			$"Итемы/Роза 5".visible = true
		else:
			$"Итемы/Роза 5".visible = false
			
			
		if Global.номер_сцены_в_которой_находится_роза_белая == Global.номер_сцены:
			$"Итемы/Роза белая".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_роза_белая == 1010:
			$"Итемы/Роза белая".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_роза_белая == 1020:
			$"Итемы/Роза белая".visible = true
		else:
			$"Итемы/Роза белая".visible = false
			
		if Global.номер_сцены_в_которой_находится_мрамор == Global.номер_сцены:
			$"Итемы/Мрамор".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_мрамор == 1010:
			$"Итемы/Мрамор".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_мрамор == 1020:
			$"Итемы/Мрамор".visible = true
		else:
			$"Итемы/Мрамор".visible = false
			
			
		if Global.номер_сцены_в_которой_находится_камень_перидот == Global.номер_сцены:
			$"Итемы/Камень Перидот".visible = true
		elif Global.включил_вторые_10_ячеек == false and Global.номер_сцены_в_которой_находится_камень_перидот == 1010:
			$"Итемы/Камень Перидот".visible = true
		elif Global.включил_вторые_10_ячеек == true and Global.номер_сцены_в_которой_находится_камень_перидот == 1020:
			$"Итемы/Камень Перидот".visible = true
		else:
			$"Итемы/Камень Перидот".visible = false
			
		
		# Движение игрока, после смены локации
		if Global.номер_сцены == 1:
			# Первая координата передающаяся в функцию - это $player.position - координата в которой игрок появляется
			# Вторая координата - это Global.target_position - координата в которую игрок будет идти
			движение_игрока_после_смены_локации(Vector2(872, 700), Vector2(871, 550)) 
		elif Global.номер_сцены == 2 and Global.предыдущий_номер_сцены == 1:
			движение_игрока_после_смены_локации(Vector2(1032, 330), Vector2(1030, 430)) 
		elif Global.номер_сцены == 3 and Global.предыдущий_номер_сцены == 4: 
			движение_игрока_после_смены_локации(Vector2(-50, 516), Vector2(252, 516))
		elif Global.номер_сцены == 4 and Global.предыдущий_номер_сцены == 5:
			движение_игрока_после_смены_локации(Vector2(-50, 516), Vector2(252, 516))
		elif Global.номер_сцены == 4 and Global.предыдущий_номер_сцены == 3:
			движение_игрока_после_смены_локации(Vector2(2300, 560), Vector2(1780, 560))
		elif Global.номер_сцены == 5 and Global.предыдущий_номер_сцены == 4:
			движение_игрока_после_смены_локации(Vector2(2000, 210), Vector2(1600, 210))
		elif Global.номер_сцены == 6 and Global.предыдущий_номер_сцены == 5:
			движение_игрока_после_смены_локации(Vector2(1200, 700), Vector2(1300, 420))
		elif Global.номер_сцены == 5 and Global.предыдущий_номер_сцены == 6:
			движение_игрока_после_смены_локации(Vector2(1000, 0), Vector2(900, 300))
		elif Global.номер_сцены == 7:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1764, 648))
		elif Global.номер_сцены == 6 and Global.предыдущий_номер_сцены == 7:
			движение_игрока_после_смены_локации(Vector2(1000, 400), Vector2(1200, 400))
		elif Global.номер_сцены == 8 and Global.предыдущий_номер_сцены == 3:
			движение_игрока_после_смены_локации(Vector2(-400, 516), Vector2(252, 516))
			
		elif Global.номер_сцены == 3 and Global.предыдущий_номер_сцены == 8:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
		elif Global.номер_сцены == 9 and Global.предыдущий_номер_сцены == 8:
			движение_игрока_после_смены_локации(Vector2(-50, 468),  Vector2(132, 468))
		elif Global.номер_сцены == 8 and Global.предыдущий_номер_сцены == 9:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
			
		elif Global.номер_сцены == 10 and Global.предыдущий_номер_сцены == 9:
			движение_игрока_после_смены_локации(Vector2(-400, 624), Vector2(132, 624))
			
		elif Global.номер_сцены == 9 and Global.предыдущий_номер_сцены == 10:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
		elif Global.номер_сцены == 11 and Global.предыдущий_номер_сцены == 10:
			движение_игрока_после_смены_локации(Vector2(997, 700), Vector2(996, 648))
		elif Global.номер_сцены == 10 and Global.предыдущий_номер_сцены == 11:
			движение_игрока_после_смены_локации(Vector2(1000, 0), Vector2(900, 300))
		elif Global.номер_сцены == 12 and Global.предыдущий_номер_сцены == 11:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 11 and Global.предыдущий_номер_сцены == 12:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
		elif Global.номер_сцены == 13:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 12 and Global.предыдущий_номер_сцены == 13:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
		elif Global.номер_сцены == 14:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
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
			движение_игрока_после_смены_локации(Vector2(2000, 504), Vector2(1692, 504))
		elif Global.номер_сцены == 16 and Global.предыдущий_номер_сцены == 17:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 18 and Global.предыдущий_номер_сцены == 17:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
		elif Global.номер_сцены == 17 and Global.предыдущий_номер_сцены == 18:
			движение_игрока_после_смены_локации(Vector2(-50, 560), Vector2(130, 560))
		elif Global.номер_сцены == 19 and Global.предыдущий_номер_сцены == 18:
			движение_игрока_после_смены_локации(Vector2(2000, 560), Vector2(1780, 560))
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
	if Global.item_взял == true:
		Global.нельзя_положить_предмет = true
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
	Global.нельзя_положить_предмет = false
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
	if Global.item_взял == true:
		Global.нельзя_положить_предмет = true
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
	Global.нельзя_положить_предмет = false
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
	if Global.item_взял == true:
		Global.нельзя_положить_предмет = true
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
	Global.нельзя_положить_предмет = false
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
	if Global.item_взял == true:
		Global.нельзя_положить_предмет = true
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
	Global.нельзя_положить_предмет = false
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.item_взял == false:
			Input.set_custom_mouse_cursor(null)
		else:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = false
			Global.взятый_предмет.get_node("Sprite2D").visible = true

# Брэндон идет в нужную координату и начинается заставка
func _on_area_2d_down_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.была_заставка_с_деревом == false:
				Global.target_position = Vector2(1284, 636)
			elif Global.номер_сцены == 2:
				Global.target_position = Vector2(1296, 504)
				
				
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
		elif Global.номер_сцены == 19:
			get_tree().change_scene_to_file("res://Финальная сцена Глава 1/финальная_сцена_глава_1.tscn")
		
			
func _on_area_2d_left_body_exited(player):
	Global.левый_бордер_активный = true

func _on_area_2d_right_body_entered(body: Node2D) -> void:
	if Global.карта_включена == false and Global.правый_бордер_активный == true:
		if Брэндон_пришел_в_позицию_перехода_в_другую_сцену == false and Global.номер_сцены == 3:
			Global.target_position = Vector2(2300, 516)
			Global.заблокировать_ввод = true
			Брэндон_пришел_в_позицию_перехода_в_другую_сцену = true
		if Брэндон_пришел_в_позицию_перехода_в_другую_сцену == false and Global.номер_сцены == 8:
			Global.target_position = Vector2(2300, 516)
			Global.заблокировать_ввод = true
			Брэндон_пришел_в_позицию_перехода_в_другую_сцену = true
		if Брэндон_пришел_в_позицию_перехода_в_другую_сцену == false and Global.номер_сцены == 9:
			Global.target_position = Vector2(2300, 516)
			Global.заблокировать_ввод = true
			Брэндон_пришел_в_позицию_перехода_в_другую_сцену = true
			
			
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
		#elif Global.номер_сцены == 8:
		#	Global.номер_сцены = 9
		#	Global.предыдущий_номер_сцены = 8
		#	Global.scene_changed = true
		#elif Global.номер_сцены == 9:
		#	Global.номер_сцены = 10
		#	Global.предыдущий_номер_сцены = 9
		#	Global.scene_changed = true
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
		elif Global.номер_сцены == 19:
			get_tree().change_scene_to_file("res://Финальная сцена Глава 1/финальная_сцена_глава_1.tscn")	
					
func _on_area_2d_down_body_exited(player):
	Global.нижний_бордер_активный = true
			
###################################    Функция запуска музыки     ################################
func запустить_музыку():
	# Если музыка уже играет, сохранить текущую позицию
	if Global.запустить_заставку_с_деревом == true:
		Global.текущая_секунда_музыки = 0.0
	elif Global.в_седьмой_сцене_должна_быть_музыка_диалога == true and $AudioStreamPlayer.playing and Global.музыка != preload("res://Assets/Музыка/08 Оригинал Brynn's Theme.mp3") and Global.музыка != preload("res://Assets/Музыка/08 Улучшенная Brynn's Theme.mp3"):
		Global.текущая_секунда_музыки = 0.0
	elif $AudioStreamPlayer.playing:
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

	
	# Выбор трека в зависимости от сцены и настроек
	if (Global.в_первой_сцене_должна_быть_музыка_с_деревом == true or Global.запустить_заставку_с_деревом == true) and Global.музыка_улучшенная == false:
		Global.в_первой_сцене_должна_быть_музыка_с_деревом = true
		Global.музыка = preload("res://Assets/Музыка/05 Оригинал Speech of the Land.mp3")
	elif (Global.в_первой_сцене_должна_быть_музыка_с_деревом == true or Global.запустить_заставку_с_деревом == true) and Global.музыка_улучшенная == true:
		Global.в_первой_сцене_должна_быть_музыка_с_деревом = true
		Global.музыка = preload("res://Assets/Музыка/05 Улучшенная Speech of the Land.mp3")
	elif Global.номер_сцены == 1 and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/167 Оригинал Castle Kyrandia 3.mp3")
	elif Global.номер_сцены == 1 and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/167 Улучшенная Castle Kyrandia 3.mp3")
	elif (Global.номер_сцены == 2 or Global.номер_сцены == 3 or Global.номер_сцены == 4 or Global.номер_сцены == 5 or Global.номер_сцены == 6 or Global.номер_сцены == 8 or Global.номер_сцены == 10 or Global.номер_сцены == 11 or Global.номер_сцены == 12 or Global.номер_сцены == 13 or Global.номер_сцены == 14 or Global.номер_сцены == 15 or Global.номер_сцены == 16 ) and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/06 Оригинал Brandon's Home.mp3")
	elif (Global.номер_сцены == 2 or Global.номер_сцены == 3 or Global.номер_сцены == 4 or Global.номер_сцены == 5 or Global.номер_сцены == 6 or Global.номер_сцены == 8 or Global.номер_сцены == 10 or Global.номер_сцены == 11 or Global.номер_сцены == 12 or Global.номер_сцены == 13 or Global.номер_сцены == 14 or Global.номер_сцены == 15 or Global.номер_сцены == 16) and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/06 Улучшенная Brandon's Home.mp3")
	
	elif Global.номер_сцены == 7 and Global.в_седьмой_сцене_должна_быть_музыка_диалога == true and Global.музыка_улучшенная == false:
		Global.музыка = preload("res://Assets/Музыка/08 Оригинал Brynn's Theme.mp3")
	elif Global.номер_сцены == 7 and Global.в_седьмой_сцене_должна_быть_музыка_диалога == true and Global.музыка_улучшенная == true:
		Global.музыка = preload("res://Assets/Музыка/08 Улучшенная Brynn's Theme.mp3")
	
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
	if Global.заблокировать_ввод == true:
		return
	elif Global.заблокировать_ввод == false:
		Global.меню_игры_открылось = true
		Global.меню_открылось = true
		$"Главное меню".visible = true
		Input.set_custom_mouse_cursor(null)
	
##########################      Кнопка инвентаря переключения 10 ячеек     ######################

func _on_кнопка_инвентаря_pressed() -> void:
	if Global.заблокировать_ввод == false:
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
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 1
		взять_или_положить_предмет()
				
#######################################   Гранат   ###############################################

func _on_area_2d_гранат_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 2
		взять_или_положить_предмет()
		
#######################################   Пила   #################################################
		
func _on_area_2d_пила_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 3
		взять_или_положить_предмет()

#######################################   Яблоко   ###############################################

func _on_area_2d_яблоко_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 4
		взять_или_положить_предмет()
		
		
#######################################   Слеза   ###############################################
		
func _on_area_2d_слеза_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 5
		взять_или_положить_предмет()
		
		
#######################################   Роза 1   ###############################################

func _on_area_2d_роза_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 6
		взять_или_положить_предмет()

#######################################   Роза 2   ###############################################

func _on_area_2d_роза_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 7
		взять_или_положить_предмет()

#######################################   Роза 3   ###############################################

func _on_area_2d_роза_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 8
		взять_или_положить_предмет()

#######################################   Роза 4   ###############################################

func _on_area_2d_роза_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 9
		взять_или_положить_предмет()


#######################################   Роза 5   ###############################################

func _on_area_2d_роза_5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 10
		взять_или_положить_предмет()
		
#######################################   Роза белая   ###########################################
		
func _on_area_2d_роза_белая_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 11
		взять_или_положить_предмет()
		
#######################################   Мрамор   ##############################################

func _on_area_2d_мрамор_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 12
		взять_или_положить_предмет()
		
#######################################   Камень Перидот   ######################################
		
func _on_area_2d_камень_перидот_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and Global.карта_включена == false and Global.меню_игры_открылось == false and Global.заблокировать_ввод == false: 
		Global.номер_взятого_предмета = 13
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

#########################    Функция движения игрока, после смены локации    #####################

func движение_игрока_после_смены_локации(player_position: Vector2, target_position: Vector2) -> void:
	$player.position = player_position
	Global.target_position = target_position
	Global.is_moving = true
	$player.update_idle_animation() 
	$player.is_moving_anim = false  # Сбрасываем флаг анимации движения
	#Global.заблокировать_ввод = true потом включить это, чтобы 
	
##################################################################################################


# Функция для обработки предметов
func взять_или_положить_предмет():
	if Global.заблокировать_ввод == false:
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
			elif Global.номер_взятого_предмета == 5:
				Global.взятый_предмет = $"Итемы/Слеза"
			elif Global.номер_взятого_предмета == 6:
				Global.взятый_предмет = $"Итемы/Роза 1"
			elif Global.номер_взятого_предмета == 7:
				Global.взятый_предмет = $"Итемы/Роза 2"
			elif Global.номер_взятого_предмета == 8:
				Global.взятый_предмет = $"Итемы/Роза 3"
			elif Global.номер_взятого_предмета == 9:
				Global.взятый_предмет = $"Итемы/Роза 4"
			elif Global.номер_взятого_предмета == 10:
				Global.взятый_предмет = $"Итемы/Роза 5"
			elif Global.номер_взятого_предмета == 11:
				Global.взятый_предмет = $"Итемы/Роза белая"
			elif Global.номер_взятого_предмета == 12:
				Global.взятый_предмет = $"Итемы/Мрамор"
			elif Global.номер_взятого_предмета == 13:
				Global.взятый_предмет = $"Итемы/Камень Перидот"
				
				
		elif Global.item_взял == true: # Предмет отпускается
			# Предмет отпускается в игровом окне
			if Global.взятый_предмет.global_position.y <= 715 and Global.взятый_предмет.global_position.x > 45 and Global.взятый_предмет.global_position.x < 1780 and Global.взятый_предмет.global_position.y > 45 and Global.нельзя_положить_предмет == false:    
				
				if Global.номер_сцены == 7:
					if Global.номер_взятого_предмета == 1 and (Global.последняя_заставка_с_брин == "Анимация_второй_разговор" or Global.последняя_заставка_с_брин == "Анимация_3_изначально_взял_записку" or Global.последняя_заставка_с_брин == "Please show me the note Brandon"):
						if $"Итемы/Записка Брин".global_position.x > 150 and $"Итемы/Записка Брин".global_position.x < 410 and $"Итемы/Записка Брин".global_position.y > 290 and $"Итемы/Записка Брин".global_position.y < 580:
							Global.брэндон_идет_в_координату_в_которой_запустится_заставка = true
							Global.заблокировать_ввод = true
							Global.название_заставки = "Анимация 4 Отдал записку Брин первая часть"
							Global.последняя_заставка_с_брин = "Анимация 4 Отдал записку Брин первая часть"
							$"Итемы/Записка Брин".global_position = Vector2 (280, -220)
					elif (Global.номер_взятого_предмета == 6 or Global.номер_взятого_предмета == 7 or Global.номер_взятого_предмета == 8 or Global.номер_взятого_предмета == 9 or Global.номер_взятого_предмета == 10) and (Global.последняя_заставка_с_брин == "Анимация 4 Отдал записку Брин вторая часть" or Global.название_заставки == "Анимация 5"):
						if $"Итемы/Роза 1".global_position.x > 150 and $"Итемы/Роза 1".global_position.x < 410 and $"Итемы/Роза 1".global_position.y > 290 and $"Итемы/Роза 1".global_position.y < 580:
							$"Итемы/Роза 1".global_position = Vector2 (120, -120)
						elif $"Итемы/Роза 2".global_position.x > 150 and $"Итемы/Роза 2".global_position.x < 410 and $"Итемы/Роза 2".global_position.y > 290 and $"Итемы/Роза 2".global_position.y < 580:
							$"Итемы/Роза 2".global_position = Vector2 (220, -120)
						elif $"Итемы/Роза 3".global_position.x > 150 and $"Итемы/Роза 3".global_position.x < 410 and $"Итемы/Роза 3".global_position.y > 290 and $"Итемы/Роза 3".global_position.y < 580:
							$"Итемы/Роза 3".global_position = Vector2 (320, -120)
						elif $"Итемы/Роза 4".global_position.x > 150 and $"Итемы/Роза 4".global_position.x < 410 and $"Итемы/Роза 4".global_position.y > 290 and $"Итемы/Роза 4".global_position.y < 580:
							$"Итемы/Роза 4".global_position = Vector2 (420, -120)
						elif $"Итемы/Роза 5".global_position.x > 150 and $"Итемы/Роза 5".global_position.x < 410 and $"Итемы/Роза 5".global_position.y > 290 and $"Итемы/Роза 5".global_position.y < 580:
							$"Итемы/Роза 5".global_position = Vector2 (520, -120)
							
						Global.брэндон_идет_в_координату_в_которой_запустится_заставка = true
						Global.заблокировать_ввод = true
						Global.название_заставки = "Запустить Видео 6"
						Global.последняя_заставка_с_брин = "Запустить Видео 6"
						
						
						
						
						
					elif Global.взятый_предмет.global_position.x > 150 and Global.взятый_предмет.global_position.x < 410 and Global.взятый_предмет.global_position.y > 290 and Global.взятый_предмет.global_position.y < 580:
						#Global.взятый_предмет.global_position = Vector2(1600,600)
						# Центр, относительно которого будут рассчитаны возможные позиции
						var центр := Vector2(1400, 500)

						# Смещения по X и Y в допустимых пределах
						var x_offsets := [-200, -100, 0, 100, 200, 300]
						var y_offsets := [-100, 0, 100, 200]

						# Создаём список всех возможных комбинаций (не больше 16)
						var возможные_позиции: Array[Vector2] = []

						for x in x_offsets:
							for y in y_offsets:
								возможные_позиции.append(центр + Vector2(x, y))
								if возможные_позиции.size() == 16:
									break
							if возможные_позиции.size() == 16:
								break

						# Устанавливаем случайную позицию из списка
						Global.взятый_предмет.global_position = возможные_позиции.pick_random()
				
				if Global.номер_сцены == 17:
					if Global.номер_взятого_предмета == 3 and Global.последнее_сообщение_Хермана == "Вторая заставка":
						Global.брэндон_идет_в_координату_в_которой_запустится_заставка = true
						Global.заблокировать_ввод = true
						$"Итемы/Пила".global_position = Vector2 (920, -120)
						
					elif Global.взятый_предмет.global_position.x > 1210 and Global.взятый_предмет.global_position.x < 1450 and Global.взятый_предмет.global_position.y > 240 and Global.взятый_предмет.global_position.y < 620:
						#Global.взятый_предмет.global_position = Vector2(1600,600)
						# Центр, относительно которого будут рассчитаны возможные позиции
						var центр := Vector2(1400, 500)

						# Смещения по X и Y в допустимых пределах
						var x_offsets := [-300, -200, -100, 0, 100, 200, 300]
						var y_offsets := [0, 100, 200]

						# Создаём список всех возможных комбинаций (не больше 16)
						var возможные_позиции: Array[Vector2] = []

						for x in x_offsets:
							for y in y_offsets:
								возможные_позиции.append(центр + Vector2(x, y))
								if возможные_позиции.size() == 16:
									break
							if возможные_позиции.size() == 16:
								break

						# Устанавливаем случайную позицию из списка
						Global.взятый_предмет.global_position = возможные_позиции.pick_random()
						
				
				Global.item_взял = false
				Global.взятый_предмет = null
					
				if Global.номер_сцены == 4:
					if $"Итемы/Слеза".global_position.x > 880 and $"Итемы/Слеза".global_position.x < 1040 and $"Итемы/Слеза".global_position.y > 380 and $"Итемы/Слеза".global_position.y < 590:
						Global.сцена_4_слезу_установил = true
							
				
							
				if Global.номер_сцены == 12 and Global.алтарь_починен == false:
					if $"Итемы/Мрамор".global_position.x > 800 and $"Итемы/Мрамор".global_position.x < 970 and $"Итемы/Мрамор".global_position.y > 135 and $"Итемы/Мрамор".global_position.y < 280:
						Global.запустить_заставку_ремонт_алтаря = true
				if Global.номер_сцены == 12 and Global.алтарь_починен == true:
					if $"Итемы/Роза белая".global_position.x > 700 and $"Итемы/Роза белая".global_position.x < 1170 and $"Итемы/Роза белая".global_position.y > 250 and $"Итемы/Роза белая".global_position.y < 380:
						Global.запустить_заставку_превращения_белой_розы_в_амулет = true
							
				
					
				if Global.номер_взятого_предмета == 1:
					Global.номер_сцены_в_которой_находится_записка_брин = Global.номер_сцены
						
						
				elif Global.номер_взятого_предмета == 2:
					Global.номер_сцены_в_которой_находится_гранат = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 3:
					Global.номер_сцены_в_которой_находится_пила = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 4:
					Global.номер_сцены_в_которой_находится_яблоко = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 5:
					Global.номер_сцены_в_которой_находится_слеза = Global.номер_сцены
											
				elif Global.номер_взятого_предмета == 6:
					Global.номер_сцены_в_которой_находится_роза_1 = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 7:
					Global.номер_сцены_в_которой_находится_роза_2 = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 8:
					Global.номер_сцены_в_которой_находится_роза_3 = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 9:
					Global.номер_сцены_в_которой_находится_роза_4 = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 10:
					Global.номер_сцены_в_которой_находится_роза_5 = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 11:
					Global.номер_сцены_в_которой_находится_роза_белая = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 12:
					Global.номер_сцены_в_которой_находится_мрамор = Global.номер_сцены
						
				elif Global.номер_взятого_предмета == 13:
					Global.номер_сцены_в_которой_находится_камень_перидот = Global.номер_сцены
					
					
			# Предмет отпускается в ячейки
			elif Global.включил_вторые_10_ячеек == false:
				if Global.курсор_вошел_в_ячейку_1 == true:
					if Global.ячейка_1_занята == false:
						Global.item_взял = false
						Global.ячейка_1_занята = true
						Global.взятый_предмет.global_position = Vector2 (570, 960)
						Global.ячейка_1_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_2 == true:
					if Global.ячейка_2_занята == false:
						Global.item_взял = false
						Global.ячейка_2_занята = true
						Global.взятый_предмет.global_position = Vector2 (690, 960)
						Global.ячейка_2_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_3 == true:
					if Global.ячейка_3_занята == false:
						Global.item_взял = false
						Global.ячейка_3_занята = true
						Global.взятый_предмет.global_position = Vector2 (810, 960)
						Global.ячейка_3_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_4 == true:
					if Global.ячейка_4_занята == false:
						Global.item_взял = false
						Global.ячейка_4_занята = true
						Global.взятый_предмет.global_position = Vector2 (930, 960)
						Global.ячейка_4_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_5 == true:
					if Global.ячейка_5_занята == false:
						Global.item_взял = false
						Global.ячейка_5_занята = true
						Global.взятый_предмет.global_position = Vector2 (1050, 960)
						Global.ячейка_5_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_6 == true:
					if Global.ячейка_6_занята == false:
						Global.item_взял = false
						Global.ячейка_6_занята = true
						Global.взятый_предмет.global_position = Vector2 (570, 1086)
						Global.ячейка_6_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_7 == true:
					if Global.ячейка_7_занята == false:
						Global.item_взял = false
						Global.ячейка_7_занята = true
						Global.взятый_предмет.global_position = Vector2 (690, 1086)
						Global.ячейка_7_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_8 == true:
					if Global.ячейка_8_занята == false:
						Global.item_взял = false
						Global.ячейка_8_занята = true
						Global.взятый_предмет.global_position = Vector2 (810, 1086)
						Global.ячейка_8_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_9 == true:
					if Global.ячейка_9_занята == false:
						Global.item_взял = false
						Global.ячейка_9_занята = true
						Global.взятый_предмет.global_position = Vector2 (930, 1086)
						Global.ячейка_9_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_10 == true:
					if Global.ячейка_10_занята == false:
						Global.item_взял = false
						Global.ячейка_10_занята = true
						Global.взятый_предмет.global_position = Vector2 (1050, 1086)
						Global.ячейка_10_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
						
				if Global.номер_взятого_предмета == 1:
					Global.номер_сцены_в_которой_находится_записка_брин = 1010 # Положил в инвентарь, в первые 10 ячеек
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 2:
					Global.номер_сцены_в_которой_находится_гранат = 1010 # Положил в инвентарь, в первые 10 ячеек
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 3:
					Global.номер_сцены_в_которой_находится_пила = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 4:
					Global.номер_сцены_в_которой_находится_яблоко = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 5:
					Global.номер_сцены_в_которой_находится_слеза = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 6:
					Global.номер_сцены_в_которой_находится_роза_1 = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 7:
					Global.номер_сцены_в_которой_находится_роза_2 = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 8:
					Global.номер_сцены_в_которой_находится_роза_3 = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 9:
					Global.номер_сцены_в_которой_находится_роза_4 = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 10:
					Global.номер_сцены_в_которой_находится_роза_5 = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 11:
					Global.номер_сцены_в_которой_находится_роза_белая = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 12:
					Global.номер_сцены_в_которой_находится_мрамор = 1010
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 13:
					Global.номер_сцены_в_которой_находится_камень_перидот = 1010
					Global.номер_взятого_предмета = 0
					
					
				$"Итемы/AudioStreamPlayer звук предмет кладется в ячейку".play()
					
			elif Global.включил_вторые_10_ячеек == true:
				if Global.курсор_вошел_в_ячейку_11 == true:
					if Global.ячейка_11_занята == false:
						Global.item_взял = false
						Global.ячейка_11_занята = true
						Global.взятый_предмет.global_position = Vector2 (570, 960)
						Global.ячейка_11_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_12 == true:
					if Global.ячейка_12_занята == false:
						Global.item_взял = false
						Global.ячейка_12_занята = true
						Global.взятый_предмет.global_position = Vector2 (690, 960)
						Global.ячейка_12_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_13 == true:
					if Global.ячейка_13_занята == false:
						Global.item_взял = false
						Global.ячейка_13_занята = true
						Global.взятый_предмет.global_position = Vector2 (810, 960)
						Global.ячейка_13_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_14 == true:
					if Global.ячейка_14_занята == false:
						Global.item_взял = false
						Global.ячейка_14_занята = true
						Global.взятый_предмет.global_position = Vector2 (930, 960)
						Global.ячейка_14_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_15 == true:
					if Global.ячейка_15_занята == false:
						Global.item_взял = false
						Global.ячейка_15_занята = true
						Global.взятый_предмет.global_position = Vector2 (1050, 960)
						Global.ячейка_15_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_16 == true:
					if Global.ячейка_16_занята == false:
						Global.item_взял = false
						Global.ячейка_16_занята = true
						Global.взятый_предмет.global_position = Vector2 (570, 1086)
						Global.ячейка_16_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_17 == true:
					if Global.ячейка_17_занята == false:
						Global.item_взял = false
						Global.ячейка_17_занята = true
						Global.взятый_предмет.global_position = Vector2 (690, 1086)
						Global.ячейка_17_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_18 == true:
					if Global.ячейка_18_занята == false:
						Global.item_взял = false
						Global.ячейка_18_занята = true
						Global.взятый_предмет.global_position = Vector2 (810, 1086)
						Global.ячейка_18_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_19 == true:
					if Global.ячейка_19_занята == false:
						Global.item_взял = false
						Global.ячейка_19_занята = true
						Global.взятый_предмет.global_position = Vector2 (930, 1086)
						Global.ячейка_19_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
				elif Global.курсор_вошел_в_ячейку_20 == true:
					if Global.ячейка_20_занята == false:
						Global.item_взял = false
						Global.ячейка_20_занята = true
						Global.взятый_предмет.global_position = Vector2 (1050, 1086)
						Global.ячейка_20_предмет_в_ней = Global.взятый_предмет
						Global.взятый_предмет = null
						
						
				if Global.номер_взятого_предмета == 1:
					Global.номер_сцены_в_которой_находится_записка_брин = 1020 # Положил в инвентарь, во вторые 10 ячеек
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 2:
					Global.номер_сцены_в_которой_находится_гранат = 1020 # Положил в инвентарь, во вторые 10 ячеек
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 3:
					Global.номер_сцены_в_которой_находится_пила = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 4:
					Global.номер_сцены_в_которой_находится_яблоко = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 5:
					Global.номер_сцены_в_которой_находится_слеза = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 6:
					Global.номер_сцены_в_которой_находится_роза_1 = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 7:
					Global.номер_сцены_в_которой_находится_роза_2 = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 8:
					Global.номер_сцены_в_которой_находится_роза_3 = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 9:
					Global.номер_сцены_в_которой_находится_роза_4 = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 10:
					Global.номер_сцены_в_которой_находится_роза_5 = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 11:
					Global.номер_сцены_в_которой_находится_роза_белая = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 12:
					Global.номер_сцены_в_которой_находится_мрамор = 1020 
					Global.номер_взятого_предмета = 0
				elif Global.номер_взятого_предмета == 13:
					Global.номер_сцены_в_которой_находится_камень_перидот = 1020 
					Global.номер_взятого_предмета = 0	
					
				$"Итемы/AudioStreamPlayer звук предмет кладется в ячейку".play()


func открыть_карту():
	if Global.игра_запущена == true:
		Global.меню_игры_открылось = true # Чтобы игрок при закрытии карты не двигался
		Global.карта_включена = true
		$"Node2D Карта".visible = true
		$"Node2D Карта/CanvasLayer Закрыть карту".visible = true
		if Global.язык_игры == "en":
			$"Node2D Карта/Label Тёмный лес".text = "Dark forest"
			$"Node2D Карта/Label Южный утес".text = "A southern cliff"
			$"Node2D Карта/Label Дом Дарма".text = "Darm's House"
		elif Global.язык_игры == "ru":
			$"Node2D Карта/Label Тёмный лес".text = "Тёмный лес"
			$"Node2D Карта/Label Южный утес".text = "Южный утёс"
			$"Node2D Карта/Label Дом Дарма".text = "Дом Дарма"
		
		
		if Global.номер_сцены == 1:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 180)
		elif Global.номер_сцены == 2:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 298)
		elif Global.номер_сцены == 3:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 416)
		elif Global.номер_сцены == 3:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 416)
		elif Global.номер_сцены == 4:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (801, 416)
		elif Global.номер_сцены == 5:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (683, 416)
		elif Global.номер_сцены == 6:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (683, 298)
		elif Global.номер_сцены == 7:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (565, 298)
		elif Global.номер_сцены == 8:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1037, 416)
		elif Global.номер_сцены == 9:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1155, 416)
		elif Global.номер_сцены == 10:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 416)
		elif Global.номер_сцены == 11:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 298)
		elif Global.номер_сцены == 12:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1391, 298)
		elif Global.номер_сцены == 13:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1509, 298)
		elif Global.номер_сцены == 14:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1155, 298)
		elif Global.номер_сцены == 15:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 534)
		elif Global.номер_сцены == 16:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 652)
		elif Global.номер_сцены == 17:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1155, 652)
		elif Global.номер_сцены == 18:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 180)
		elif Global.номер_сцены == 19:
			$"Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (801, 180)
		
		if Global.номер_сцены <= 17:
			$"Node2D Карта/Карта".texture = preload("res://Карта/Карта Глава первая.png")
			if Global.язык_игры == "ru":
				$"Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "Тёмный лес"
			elif Global.язык_игры == "en":
				$"Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "Dark forest"
			$"Node2D Карта/Квадрат сцена 18".visible = false
			$"Node2D Карта/Sprite2D Темный лес".visible = false
			$"Node2D Карта/Label Тёмный лес".visible = false
			$"Node2D Карта/Sprite2D Южный утес".visible = false
			$"Node2D Карта/Label Южный утес".visible = false
			$"Node2D Карта/Sprite2D Дом Дарма".visible = false
			$"Node2D Карта/Label Дом Дарма".visible = false
			
			# Для отображения значков локаций
			if 8 in Global.номера_сцен_в_которых_был_игрок or 10 in Global.номера_сцен_в_которых_был_игрок or 11 in Global.номера_сцен_в_которых_был_игрок or 14 in Global.номера_сцен_в_которых_был_игрок:
				$"Node2D Карта/Sprite2D Темный лес".visible = true
				$"Node2D Карта/Label Тёмный лес".visible = true
			if 5 in Global.номера_сцен_в_которых_был_игрок:
				$"Node2D Карта/Sprite2D Южный утес".visible = true
				$"Node2D Карта/Label Южный утес".visible = true
	
			
			for i in range(2, 18):
				if i in Global.номера_сцен_в_которых_был_игрок:
					get_node("Node2D Карта/Квадрат сцена %d" % i).visible = false
			
		elif Global.номер_сцены >= 18:
			$"Node2D Карта/Карта".texture = preload("res://Карта/Карта Глава вторая.png")
			if Global.язык_игры == "ru":
				$"Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "Строевой лес"
			elif Global.язык_игры == "en":
				$"Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "The Timbermist Woods"
			$"Node2D Карта/Sprite2D Темный лес".visible = false
			$"Node2D Карта/Label Тёмный лес".visible = false
			$"Node2D Карта/Sprite2D Южный утес".visible = false
			$"Node2D Карта/Label Южный утес".visible = false
			$"Node2D Карта/Sprite2D Дом Дарма".visible = false
			$"Node2D Карта/Label Дом Дарма".visible = false
			
			# Для отображения значков локаций
			if 18 in Global.номера_сцен_в_которых_был_игрок:
				$"Node2D Карта/Sprite2D Темный лес".visible = true
				$"Node2D Карта/Label Тёмный лес".visible = true
			if 19 in Global.номера_сцен_в_которых_был_игрок:
				$"Node2D Карта/Sprite2D Дом Дарма".visible = true
				$"Node2D Карта/Label Дом Дарма".visible = true
			
			for i in range(18, 20):
				if i in Global.номера_сцен_в_которых_был_игрок:
					get_node("Node2D Карта/Квадрат сцена %d" % i).visible = false
		
		

func закрыть_карту():
	$"Главное меню".visible = false
	$"Node2D Карта".visible = false
	$"Node2D Карта/CanvasLayer Закрыть карту".visible = false
	Global.карта_включена = false
	Global.меню_игры_открылось = false
	if Global.item_взял == true:
		Input.set_custom_mouse_cursor(Global.cursor_with_item)
	

		

# Это аудио, которое говорит Брэндон
func _on_audio_stream_player_что_говорит_брэндон_finished() -> void:
	if Global.анимация_Брэндон_говорит_закончилось == true:
		Global.анимация_Брэндон_говорит_закончилось = false
		Global.аудио_Брэндон_говорит_закончилось = false
		Global.текст_брэндона.text = ""
		Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
		Global.is_moving = true
		Global.заблокировать_ввод = false
	elif Global.анимация_Брэндон_говорит_закончилось == false:
		Global.аудио_Брэндон_говорит_закончилось = true
		
