extends Sprite2D

var cursor_strelka_up = preload("res://Assets/Cursors/Cursor_1_Up.png")
var Брэндон_пришел_в_стартовую_позицию = false
var player

func _ready():
	player = get_node("/root/Game/player")
	if Global.в_первой_сцене_должна_быть_музыка_с_деревом == true:
		Global.в_первой_сцене_должна_быть_музыка_с_деревом = false
	
	Global.номер_сцены = 2
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.в_первой_сцене_должна_быть_музыка = false
	
	if Global.предыдущий_номер_сцены == 3:
		player.global_position = Vector2 (1900,-1900)
	
	if Global.предыдущий_номер_сцены == 1:
		Global.поменять_музыку = true
	if Global.предыдущий_номер_сцены == 3:
		Global.заблокировать_ввод = true
		Global.is_moving = false
		$"AnimatedSprite2D подьем вверх".visible = true
		$"AnimatedSprite2D подьем вверх".play("default")
		$"AudioStreamPlayer Подьем на дерево".play()
	
	if 2 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(2) # добавляю в массив номер этой сцены
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "У входа в дом Брэндона"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Outside Brandon's home"
	
		
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = true
	


func _on_area_2d_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		Input.set_custom_mouse_cursor(cursor_strelka_up)
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
	Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_1 = true


func _on_area_2d_body_exited(player):
	Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_1 = false
	
func _process(delta: float) -> void:
	# Когда Брэндон достигнет стартовой позиции в этой локации, разблокируется управление
	if Брэндон_пришел_в_стартовую_позицию == false:
		if Global.player.global_position == Vector2(1030, 430):
			Global.заблокировать_ввод = false
			Брэндон_пришел_в_стартовую_позицию = true
	
	
	if Global.кликнул_в_сцене2_во_вход_в_дом == true and Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_1 == true and Global.заблокировать_ввод == false and Global.is_moving == true:
		Global.номер_сцены = 1
		Global.предыдущий_номер_сцены = 2
		Global.кликнул_в_сцене2_во_вход_в_дом = false
		Global.заблокировать_ввод = false
		Global.is_moving = true
		Global.scene_changed = true
	if Global.запустить_заставку == true:
		Global.запустить_заставку = false
		if Global.название_заставки == "спуск с дерева":
			$"AnimatedSprite2D Спуск с дерева".visible = true
			$"AnimatedSprite2D Спуск с дерева".play("default")
		
			
			

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Global.нельзя_положить_предмет == false:
			Global.кликнул_в_сцене2_во_вход_в_дом = true
	

func _on_animated_sprite_2d_спуск_с_дерева_animation_finished() -> void:
	Global.scene_changed = true
	Global.номер_сцены = 3
	Global.предыдущий_номер_сцены = 2
	

func _on_animated_sprite_2d_подьем_вверх_animation_finished() -> void:
	$"AnimatedSprite2D подьем вверх".visible = false
	Global.заблокировать_ввод = false
	Global.is_moving = true
	player.global_position = Vector2(1220, 490)
