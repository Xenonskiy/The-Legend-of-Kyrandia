extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var сцена_7_запустить_заставку: bool = false

var left: String = "left"
var right: String = "right"
var up: String = "up"
var down: String = "down"
var idle_right: String = "idle_right"
var idle_left: String = "idle_left"
var talk_left_short: String = "talk_left_short"
var talk_right_short: String = "talk_right_short"
var talk_left_long: String = "talk_left_long"
var talk_right_long: String = "talk_right_long"

var last_direction: String = right
var last_main_direction: String = right
var is_moving_anim: bool = false



func _ready() -> void:
	set_process_input(true)

func _input(event: InputEvent) -> void:
	# Блокируем ввод если открыто меню или взят предмет
	if Global.is_menu_open or Global.item_взял or Global.заблокировать_ввод == true:
		return

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Global.target_position = get_global_mouse_position() + Vector2 (0, -143)   # было Global.target_position = get_global_mouse_position() + Vector2 (0, -125)
		if Global.target_position.y < 709:
			Global.is_moving = true
			is_moving_anim = false  # Сброс анимации перед запуском нового движения
		
					

func _process(delta: float) -> void:
	if Global.переместить_Брэндона == true:
		Global.переместить_Брэндона = false
		Global.target_position = Global.координаты_Брэндона_для_переноса
		global_position = Global.координаты_Брэндона_для_переноса
		last_direction = left
		last_main_direction = left
		anim.play(idle_left)
	

	if Global.координаты_клика_мыши_сделать_равными_координате_игрока == true:
		Global.координаты_клика_мыши_сделать_равными_координате_игрока = false
		Global.target_position = global_position
	
	if Global.номер_сцены == 2 and global_position == Vector2(1296, 504):
		global_position = Vector2(1600, 504)
		Global.target_position = global_position
		last_direction = right
		last_main_direction = right
		anim.play(idle_right)
		Global.название_заставки = "спуск с дерева"
		Global.запустить_заставку = true
		Global.заблокировать_ввод = true
		Global.is_moving = false
		
	if Global.номер_сцены == 2 and Global.предыдущий_номер_сцены == 3 and global_position == Vector2(1500, 516):
		global_position = Vector2(1260, 516)
		Global.target_position = global_position 
		
	if Global.номер_сцены == 3 and Global.предыдущий_номер_сцены == 2 and global_position == Vector2(1600, 504):
		global_position = Vector2(1668, 552)
		Global.target_position = global_position 
		last_direction = right
		last_main_direction = right
		anim.play(idle_right)
		
	if Global.номер_сцены == 3 and Global.кликнул_в_сцене3_в_area2d_подьем_вверх == true:
		Global.кликнул_в_сцене3_в_area2d_подьем_вверх = false
		Global.target_position = Vector2(1566, 498)
		
	if Global.номер_сцены == 3 and global_position == Vector2(1566, 498):
		global_position = Vector2(1500, 516)
		Global.target_position = global_position 
		last_direction = left
		last_main_direction = left
		anim.play(idle_left)
		Global.название_заставки = "подьем на дерево локация 3"
		Global.запустить_заставку = true
		Global.заблокировать_ввод = true
		Global.is_moving = false
	
	if Global.номер_сцены == 4:
		if Global.брэндон_идет_в_координату_в_которой_запустится_заставка == true:
			Global.is_moving = true
			Global.заблокировать_ввод = true
			Global.target_position = Vector2 (756, 552) # Игрок идет в координату в которой начинается заставка
			if Global.target_position == Vector2 (756, 552) and global_position == Global.target_position:
				last_direction = right
				last_main_direction = right
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				Global.запустить_заставку_с_сцена_4 = true
	
	
	if Global.номер_сцены == 7:
		if Global.брэндон_идет_в_координату_в_которой_запустится_заставка == true:
			#Global.заблокировать_ввод = true
			Global.is_moving = true
			Global.target_position = Vector2 (552, 510) # Игрок идет в координату в которой начинается заставка
			Global.is_moving = true
			if Global.target_position == Vector2 (552, 510) and global_position == Global.target_position:
				сцена_7_запустить_заставку = true
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				
				
			
			
		elif сцена_7_запустить_заставку == true:
			сцена_7_запустить_заставку = false
			if Global.последняя_заставка_с_брин == "Запустить Видео 6" or Global.название_заставки == "Запустить Видео 6":
				Global.название_заставки = "Запустить Видео 6"
				Global.последняя_заставка_с_брин = "Запустить Видео 6"
				Global.is_moving = false
				Global.запустить_заставку = true
				
			elif Global.последняя_заставка_с_брин == "" and Global.записка_брин_взял_со_стола == false:
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				Global.название_заставки = "Анимация_первый_разговор_с_Брин_записка_не_взята"
				Global.запустить_заставку = true
				Global.is_moving = false
			elif Global.последняя_заставка_с_брин == "" and Global.записка_брин_взял_со_стола == true:
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				Global.название_заставки = "Анимация_3_изначально_взял_записку"
				Global.запустить_заставку = true
				Global.is_moving = false
				
			elif Global.последняя_заставка_с_брин == "Did_you_find_a_clue_Brandon":
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				Global.название_заставки = "Анимация_второй_разговор"
				Global.запустить_заставку = true
				Global.is_moving = false
				Global.в_седьмой_сцене_должна_быть_музыка_диалога = true
				Global.поменять_музыку = true
				
			elif Global.последняя_заставка_с_брин == "Анимация 4 Отдал записку Брин первая часть":
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				Global.запустить_заставку = true
				Global.is_moving = false
			
			

	if Global.номер_сцены == 9:
		if Global.брэндон_идет_в_координату_в_которой_запустится_заставка == true:
			Global.is_moving = true
			Global.target_position = Vector2 (1236, 414) # Игрок идет в координату в которой начинается заставка
			if Global.target_position == Vector2 (1236, 414) and global_position == Global.target_position:
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				last_direction = left
				last_main_direction = left
				anim.play(idle_left)
				Global.запустить_заставку_Брэндон_ловит_слезу = true
				
	
	if Global.номер_сцены == 15:
		if Global.брэндон_идет_в_координату_в_которой_запустится_заставка == true:
			Global.is_moving = true
			Global.заблокировать_ввод = true
			Global.target_position = Vector2 (900, 468) # Игрок идет в координату в которой начинается заставка
			if Global.target_position == Vector2 (900, 468) and global_position == Global.target_position:
				last_direction = left
				last_main_direction = left
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				Global.запустить_заставку_с_Херманом = true
				
	
	if Global.номер_сцены == 17:
		if Global.брэндон_идет_в_координату_в_которой_запустится_заставка == true:
			Global.is_moving = true
			Global.заблокировать_ввод = true
			Global.target_position = Vector2 (1596, 408) # Игрок идет в координату в которой начинается заставка
			if Global.target_position == Vector2 (1596, 408) and global_position == Global.target_position:
				last_direction = left
				last_main_direction = left
				Global.брэндон_идет_в_координату_в_которой_запустится_заставка = false
				Global.запустить_заставку_с_Херманом = true
				
	
	# Добавляем исключение для позиции Брэндона перед анимацией с деревом
	if Global.была_заставка_с_деревом == false and global_position == Vector2(1284, 636):
		global_position = Vector2(996, 492)
		Global.target_position = global_position 
		last_direction = left
		last_main_direction = left
		anim.play(idle_left)
		Global.is_moving = false
		Global.запустить_заставку_с_деревом = true
		Global.была_заставка_с_деревом = true
		Global.заставка_с_деревом_проигрывается = true
		
		
		
	if Global.заставка_с_деревом_проигрывается == true:
		Global.is_moving = false
		
		
	if Global.заставка_с_деревом_закончилась == true and Global.заставка_с_деревом_проигрывается == false:
		Global.заставка_с_деревом_закончилась = false
		global_position = Vector2(996, 492)
		last_direction = left
		last_main_direction = left
		anim.play(idle_left)
		Global.is_moving = true
		Global.target_position = global_position 
		
		
	
	
	# Если предмет взят, при этом Брендон может поворачиваться в его сторону или не поворачиваться.
	# Этот вариант, когда Брэндон поваричается в сторону в которой лежит предмет
	#if Global.item_взял and Global.target_position.y < 673: # Для предмета, когда он выше инвентаря, то есть в игровом окне
	#	if Global.target_position < global_position:
	#		anim.play(idle_left)
	#	else:
	#		anim.play(idle_right)
	#if Global.item_взял == true:
	#	if Global.target_position.x > global_position.x or last_main_direction == "right":
	#		anim.play(idle_right)
	#		last_direction = right
	#		last_main_direction = right
	#	elif Global.target_position.x < global_position.x or last_main_direction == "left":
	#		anim.play(idle_left)
	#		last_direction = left
	#		last_main_direction = left
	#	Global.target_position = global_position 
	if Global.item_взял == true:
		Global.target_position = global_position 
		if last_direction == right or last_direction == right:
			anim.play(idle_right)
		elif last_direction == left or last_direction == left:
			anim.play(idle_left)
		
	
	
	
	
	
			
			
			
		
	
	if Global.текст_брэндона_изменился == true:
		Global.текст_брэндона_изменился = false
		Global.is_moving = false
		Global.заблокировать_ввод = true
		# Определяем направление относительно последнего клика
		if Global.target_position.x > global_position.x:
			if Global.запустить_короткую_анимацию_разговора_Брэндона == true:
				Global.запустить_короткую_анимацию_разговора_Брэндона = false
				anim.play(talk_right_short)
				last_direction = right
				last_main_direction = right
			elif Global.запустить_длинную_анимацию_разговора_Брэндона == true:
				Global.запустить_длинную_анимацию_разговора_Брэндона = false
				anim.play(talk_right_long)
				last_direction = right
				last_main_direction = right
		elif Global.target_position.x < global_position.x:
			if Global.запустить_короткую_анимацию_разговора_Брэндона == true:
				Global.запустить_короткую_анимацию_разговора_Брэндона = false
				anim.play(talk_left_short)
				last_direction = left
				last_main_direction = left
			elif Global.запустить_длинную_анимацию_разговора_Брэндона == true:
				Global.запустить_длинную_анимацию_разговора_Брэндона = false
				anim.play(talk_left_long)
				last_direction = left
				last_main_direction = left
		elif last_main_direction == right or last_direction == right:
			if Global.запустить_короткую_анимацию_разговора_Брэндона == true:
				Global.запустить_короткую_анимацию_разговора_Брэндона = false
				anim.play(talk_right_short)
				last_direction = right
				last_main_direction = right
			elif Global.запустить_длинную_анимацию_разговора_Брэндона == true:
				Global.запустить_длинную_анимацию_разговора_Брэндона = false
				anim.play(talk_right_long)
				last_direction = right
				last_main_direction = right
		elif last_main_direction == left or last_direction == left:
			if Global.запустить_короткую_анимацию_разговора_Брэндона == true:
				Global.запустить_короткую_анимацию_разговора_Брэндона = false
				anim.play(talk_left_short)
				last_direction = left
				last_main_direction = left
			elif Global.запустить_длинную_анимацию_разговора_Брэндона == true:
				Global.запустить_длинную_анимацию_разговора_Брэндона = false
				anim.play(talk_left_long)
				last_direction = left
				last_main_direction = left
		Global.координаты_игрока_перед_открытием_меню = global_position
		Global.target_position = global_position
		
			
	if Global.запустить_анимацию_диалога_Брэндона_после_смены_локации == true:
		Global.запустить_анимацию_диалога_Брэндона_после_смены_локации = false
		# Определяем направление относительно последнего клика
		if Global.target_position.x > global_position.x or last_main_direction == "right":
			anim.play(talk_right_long)
			last_direction = right
			last_main_direction = right
		else:
			anim.play(talk_left_long)
			last_direction = left
			last_main_direction = left
			
		Global.координаты_игрока_перед_открытием_меню = global_position
		Global.target_position = global_position
		
	
		
	#if Global.запустить_длинную_анимацию_разговора_Брэндона_RIGHT == true:
	#	Global.запустить_длинную_анимацию_разговора_Брэндона_RIGHT = false
	#	anim.play(talk_right_long)
	#	last_direction = right
	#	last_main_direction = right
		
		
	#if Global.запустить_длинную_анимацию_разговора_Брэндона_LEFT == true:
	#	Global.запустить_длинную_анимацию_разговора_Брэндона_LEFT = false
	#	anim.play(talk_left_long)
	#	last_direction = left
	#	last_main_direction = left
		

	
	elif Global.меню_игры_открылось and not Global.is_menu_open:
		Global.координаты_игрока_перед_открытием_меню = global_position
		Global.is_menu_open = true
		Global.is_moving = false
		anim.play(idle_right)
		last_direction = "right"
		update_idle_animation()

	elif not Global.меню_игры_открылось and Global.is_menu_open:
		global_position = Global.координаты_игрока_перед_открытием_меню
		Global.is_menu_open = false
		return

	if Global.is_moving == true:
		if Global.target_position.y > 709:  # Проверка на превышение по оси Y
			velocity = Vector2.ZERO
			Global.is_moving = false
			update_idle_animation()
			is_moving_anim = false
		elif Global.target_position.y > 673 and Global.cursor_strelka_down == false:  # Если стрелка вниз не нажата
			velocity = Vector2.ZERO
			Global.is_moving = false
			update_idle_animation()
			is_moving_anim = false
		elif Global.target_position.x < 48 and Global.cursor_strelka_left == false:  # Если стрелка влево не нажата
			velocity = Vector2.ZERO
			Global.is_moving = false
			update_idle_animation()
			is_moving_anim = false
		elif Global.target_position.x > 1872 and Global.cursor_strelka_right == false:  # Если стрелка вправо не нажата
			velocity = Vector2.ZERO
			Global.is_moving = false
			update_idle_animation()
			is_moving_anim = false
		elif Global.target_position.y < -95 and Global.cursor_strelka_up == false:  # Если стрелка вверх не нажата
			velocity = Vector2.ZERO
			Global.is_moving = false
			update_idle_animation()
			is_moving_anim = false
		else:
			move_towards_target(delta)


func move_towards_target(delta: float) -> void:
	var to_target = Global.target_position - global_position
	var distance_to_target = to_target.length()
	var step = Global.speed * delta

	if distance_to_target <= step:
		# Если цель достигнута, останавливаем движение и обновляем анимацию
		global_position = Global.target_position
		velocity = Vector2.ZERO
		Global.is_moving = false
		update_idle_animation()
		is_moving_anim = false
		return

	# Направление движения
	var move_dir: Vector2
	var horizontal_priority: bool = abs(to_target.x) > abs(to_target.y)

	if horizontal_priority:
		move_dir = Vector2(to_target.x, 0).normalized()
	else:
		move_dir = Vector2(0, to_target.y).normalized()

	velocity = move_dir * Global.speed
	move_and_slide()

	# Анимация движения
	if velocity.length() > 10 and not is_moving_anim:
		if horizontal_priority:
			if velocity.x > 0:
				anim.play(right)
				last_direction = right
				last_main_direction = right
			else:
				anim.play(left)
				last_direction = left
				last_main_direction = left
		else:
			if velocity.y > 0:
				anim.play(down)
			else:
				anim.play(up)

			if to_target.x > 0:
				last_direction = right
				last_main_direction = right
			elif to_target.x < 0:
				last_direction = left
				last_main_direction = left
		
		is_moving_anim = true

	# Если игрок не двигается, обновляем анимацию покоя
	elif velocity.length() <= 10 and is_moving_anim:
		update_idle_animation()



func update_idle_animation() -> void:
	#anim.play(idle_right if last_main_direction == right else idle_left)
	if last_direction == right or last_main_direction == right:
		anim.play(idle_right)
	elif last_direction == left or last_main_direction == left:
		anim.play(idle_left)



func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "talk_left_long" or anim.animation == "talk_right_long" or anim.animation == "talk_left_short" or anim.animation == "talk_right_short":
		if Global.аудио_Брэндон_говорит_закончилось == true:
			Global.анимация_Брэндон_говорит_закончилось = false
			Global.аудио_Брэндон_говорит_закончилось = false
			Global.текст_брэндона.text = ""
			Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
			Global.is_moving = true
			Global.заблокировать_ввод = false
		elif Global.аудио_Брэндон_говорит_закончилось == false:
			Global.анимация_Брэндон_говорит_закончилось = true
