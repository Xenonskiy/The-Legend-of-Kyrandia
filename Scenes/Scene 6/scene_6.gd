extends Sprite2D

var cursor_strelka_left = preload("res://Assets/Cursors/Cursor_1_Left.png")

func _ready():
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
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 6/6 Улучшенная.png")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 6/6 Оригинал.png")



func _on_area_2d_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		Input.set_custom_mouse_cursor(cursor_strelka_left)
		if Global.item_взял == true:
			Global.item_там_где_меняется_курсор = true
			Global.взятый_предмет.get_node("Sprite2D").visible = false

func _on_area_2d_mouse_exited() -> void:
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
	if Global.карта_включена == false and Global.кликнул_в_сцене6_во_вход_в_храм == true:
		Global.scene_changed = true
		Global.номер_сцены = 7
		Global.кликнул_в_сцене6_во_вход_в_храм = false
		Global.предыдущий_номер_сцены = 6
		
		
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 6/6 Улучшенная.png")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 6/6 Оригинал.png")
		Global.текстуры_поменялись = false
	if Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_7 == true and Global.кликнул_в_сцене6_во_вход_в_храм == true:
		Global.scene_changed = true
		Global.номер_сцены = 7
		Global.кликнул_в_сцене6_во_вход_в_храм = false
		Global.предыдущий_номер_сцены = 6
		

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Global.кликнул_в_сцене6_во_вход_в_храм = true
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_7 = false
