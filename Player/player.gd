extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var left: String = "left"
var right: String = "right"
var up: String = "up"
var down: String = "down"
var idle_right: String = "idle_right"
var idle_left: String = "idle_left"
var talk_left_short: String = "talk_left_short"
var talk_right_short: String = "talk_right_short"

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
		Global.target_position = get_global_mouse_position() + Vector2 (0, -125)
		if Global.target_position.y > 586 and Global.cursor_strelka_down == false:
			return
		elif Global.target_position.y > 619 and Global.cursor_strelka_down == true:
			return
			
		Global.is_moving = true
		is_moving_anim = false

func _process(delta: float) -> void:
	if Global.номер_сцены == 7 and Global.сколько_раз_подошел_к_брин == 0 and Global.нажал_на_брин == true:
		Global.target_position = Vector2 (483, 446) # Игрок идет в координату в которой начинается заставка
		Global.заблокировать_ввод = true # Чтобы когда идет игрок, не было реагирования на клики мышки
		if global_position == Global.target_position:
			Global.нажал_на_брин = false
			Global.сколько_раз_подошел_к_брин = 1
			Global.запустить_заставку_с_брин = true
	
	# Добавляем исключение для позиции Брэндона перед анимацией с деревом
	if Global.была_заставка_с_деревом == false and global_position == Vector2(1124, 556):
		last_direction = right
		last_main_direction = right
		anim.play(idle_right)
		Global.is_moving = false
		Global.запустить_заставку_с_деревом = true
		Global.была_заставка_с_деревом = true
		Global.заставка_с_деревом_проигрывается = true
		
		
		
	if Global.заставка_с_деревом_проигрывается == true:
		Global.is_moving = false
		
		
	if Global.заставка_с_деревом_закончилась == true and Global.заставка_с_деревом_проигрывается == false:
		Global.заставка_с_деревом_закончилась = false
		global_position = Vector2(878, 431)
		last_direction = left
		last_main_direction = left
		anim.play(idle_left)
		Global.is_moving = true
		Global.target_position = global_position 
		
		
	
	
	# Если предмет взят - принудительно останавливаемся
	if Global.item_взял:
		Global.is_moving = false
		update_idle_animation()
		anim.stop()
		return

	
	
	if Global.текст_брэндона_изменился == true:
	# Определяем направление относительно последнего клика
		if Global.target_position.x > global_position.x:
			anim.play(talk_right_short)
			last_direction = right
			last_main_direction = right
		else:
			anim.play(talk_left_short)
			last_direction = left
			last_main_direction = left
		
		Global.текст_брэндона_изменился = false
		Global.is_moving = false
		Global.координаты_игрока_перед_открытием_меню = global_position
		

	if anim.animation == talk_left_short or anim.animation == talk_right_short:
		if not anim.is_playing():
			update_idle_animation()
		return
	
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

	if Global.is_moving:
		move_towards_target(delta)
	else:
		anim.stop()

func move_towards_target(delta: float) -> void:
	var to_target = Global.target_position - global_position
	var distance_to_target = to_target.length()
	var step = Global.speed * delta

	if distance_to_target <= step:
		global_position = Global.target_position
		velocity = Vector2.ZERO
		Global.is_moving = false
		update_idle_animation()
		is_moving_anim = false
		return

	var move_dir: Vector2
	var horizontal_priority: bool = abs(to_target.x) > abs(to_target.y)

	if horizontal_priority:
		move_dir = Vector2(to_target.x, 0).normalized()
	else:
		move_dir = Vector2(0, to_target.y).normalized()

	velocity = move_dir * Global.speed
	move_and_slide()

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

	elif velocity.length() <= 10 and is_moving_anim:
		update_idle_animation()

func update_idle_animation() -> void:
	anim.play(idle_right if last_main_direction == right else idle_left)
