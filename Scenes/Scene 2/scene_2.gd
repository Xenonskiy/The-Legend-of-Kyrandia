extends Sprite2D

var cursor_strelka_up = preload("res://Assets/Cursors/Cursor_1_Up.png")


func _ready():
	Global.номер_сцены = 2
	
	Global.в_первой_сцене_должна_быть_музыка = false
	
	if Global.предыдущий_номер_сцены == 1:
		Global.поменять_музыку = true
	
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
	
	
	if Global.текстуры_улучшенные == true:
		$".".texture = preload("res://Scenes/Scene 2/2 Улучшенная.png")
	elif Global.текстуры_улучшенные == false:
		$".".texture = preload("res://Scenes/Scene 2/2 Оригинал.png")
		
	

func _on_area_2d_mouse_entered() -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		Input.set_custom_mouse_cursor(cursor_strelka_up)
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
	Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_1 = true
	if Global.карта_включена == false:
		if Global.кликнул_в_сцене2_во_вход_в_дом == true:
			Global.scene_changed = true
			Global.номер_сцены = 1
			Global.кликнул_в_сцене2_во_вход_в_дом = false
			Global.предыдущий_номер_сцены = 2
			
			
			
			
			
			
			

func _on_area_2d_body_exited(player):
	Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_1 = false
	
func _process(delta: float) -> void:
	if Global.текстуры_поменялись == true:
		if Global.текстуры_улучшенные == true:
			$".".texture = preload("res://Scenes/Scene 2/2 Улучшенная.png")
		elif Global.текстуры_улучшенные == false:
			$".".texture = preload("res://Scenes/Scene 2/2 Оригинал.png")
		Global.текстуры_поменялись = false
	if Global.кликнул_в_сцене2_во_вход_в_дом == true and Global.игрок_внутри_зоны_ареад2_для_перехода_в_сцену_1 == true:
		Global.scene_changed = true
		Global.номер_сцены = 1
		Global.кликнул_в_сцене2_во_вход_в_дом = false
		Global.предыдущий_номер_сцены = 2
		
		
		


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Global.кликнул_в_сцене2_во_вход_в_дом = true
	
