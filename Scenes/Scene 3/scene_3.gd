extends Sprite2D

var cursor_strelka_up = preload("res://Assets/Cursors/Cursor_1_Up.png")
var Брэндон_пришел_в_стартовую_позицию = false

var номер_сообщения: int = 1
var player

func _ready():
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 3
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	
	player = get_node("/root/Game/player")
	
	if Global.в_сцене_3_должна_быть_заставка_с_Миритом == true:
		$"Sprite2D Мирит".visible = true

	if Global.предыдущий_номер_сцены == 2:
		$"AnimatedSprite2D Спуск с дерева".visible = true
		$"AnimatedSprite2D Спуск с дерева".play("default")
		$"AudioStreamPlayer Спуск с дерева".play()
		
	
	if Global.предыдущий_номер_сцены == 8: 
		Global.правый_бордер_активный = false
		$"Sprite2D Ветка".visible = true
		
	elif Global.предыдущий_номер_сцены == 4: 
		Global.левый_бордер_активный = false
		$"Sprite2D Ветка".visible = true
		
	
	if 3 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(3)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Под домом Брэндона"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Below Brandon's home"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = true
	Global.cursor_strelka_down = false
	
		
func _process(delta: float) -> void:
	if Global.запустить_заставку == true:
		Global.запустить_заставку = false
		if Global.название_заставки == "подьем на дерево локация 3":
			$"AnimatedSprite2D Подьем вверх".visible = true
			$"AnimatedSprite2D Подьем вверх".play("default")
	if Global.в_сцене_3_должна_быть_заставка_с_Миритом == true and player.global_position == Vector2(252, 516):
		Global.в_сцене_3_должна_быть_заставка_с_Миритом = false
		Global.заблокировать_ввод = true
		$"Sprite2D Мирит".visible = false
		$VideoStreamPlayer.visible = true
		$VideoStreamPlayer.play()
		

func _on_animated_sprite_2d_спуск_с_дерева_animation_finished() -> void:
	$"Sprite2D Ветка".visible = true
	Global.заблокировать_ввод = false
	Global.is_moving = true
	$"AnimatedSprite2D Спуск с дерева".visible = false
	

func _on_area_2d_подьем_вверх_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			Global.кликнул_в_сцене3_в_area2d_подьем_вверх = true
			print("123")
			

func _on_area_2d_подьем_вверх_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		Input.set_custom_mouse_cursor(cursor_strelka_up)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = true
			Global.взятый_предмет.get_node("Sprite2D").visible = false
	

func _on_area_2d_подьем_вверх_mouse_exited() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if Global.item_взял == false:
			Input.set_custom_mouse_cursor(null)
		else:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = false
			Global.взятый_предмет.get_node("Sprite2D").visible = true
			

func _on_animated_sprite_2d_подьем_вверх_animation_finished() -> void:
	Global.scene_changed = true
	Global.номер_сцены = 2
	Global.предыдущий_номер_сцены = 3
	
func _on_video_stream_player_finished() -> void:
	$VideoStreamPlayer.visible = false
	#Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
	Global.заблокировать_ввод = false
	#Global.is_moving = true
	Global.в_сцене_8_должна_быть_заставка_с_Миритом = true
