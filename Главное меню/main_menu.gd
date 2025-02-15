extends Node2D

func _input(event): # Функция чтобы можно было сделать игру на весь экран. alt + enter, esc выход
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_ENTER and event.alt_pressed:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_WINDOWED)
			elif event.keycode == KEY_ESCAPE and DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _ready():
	
	if Global.язык_игры == "ru":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "Легенда о Кирандии"
		$"Главное меню/Sprite2D/Новая игра/Желтая рамка/Label Новая игра".text = "Новая игра"
		$"Главное меню/Sprite2D/Загрузить/Желтая рамка/Label Загрузить".text = "Загрузить"
		$"Главное меню/Sprite2D/Сохранить/Желтая рамка/Label Сохранить".text = "Сохранить"
		$"Главное меню/Sprite2D/Настройки/Желтая рамка/Label Настройки".text = "Настройки"
		$"Главное меню/Sprite2D/Карта/Желтая рамка/Label Карта".text = "Карта (Клавиша M)"
		$"Главное меню/Sprite2D/Выйти из игры/Желтая рамка/Label Выйти из игры".text = "Выйти из игры"
		$"Главное меню/Sprite2D/Вернуться/Желтая рамка/Label Вернуться".text = "Вернуться"
		
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Настройки"
		$"Меню Настройки/Sprite2D/Язык/Желтая рамка/Label Язык".text = "Язык: Русский"
				
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Желтая рамка/Label Вернуться Настройки".text = "Вернуться"
		
	elif Global.язык_игры == "en":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "The Legend of Kyrandia"
		$"Главное меню/Sprite2D/Новая игра/Желтая рамка/Label Новая игра".text = "New game"
		$"Главное меню/Sprite2D/Загрузить/Желтая рамка/Label Загрузить".text = "Load game"
		$"Главное меню/Sprite2D/Сохранить/Желтая рамка/Label Сохранить".text = "Save game"
		$"Главное меню/Sprite2D/Настройки/Желтая рамка/Label Настройки".text = "Settings"
		$"Главное меню/Sprite2D/Карта/Желтая рамка/Label Карта".text = "Map (Key M)"
		$"Главное меню/Sprite2D/Выйти из игры/Желтая рамка/Label Выйти из игры".text = "Exit the game"
		$"Главное меню/Sprite2D/Вернуться/Желтая рамка/Label Вернуться".text = "Return"
		
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Settings"
		$"Меню Настройки/Sprite2D/Язык/Желтая рамка/Label Язык".text = "Language: English"
				
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Желтая рамка/Label Вернуться Настройки".text = "Return"

	##########################   Кнопка Озвучка      #############################################
	if Global.язык_игры == "ru" and Global.озвучка == "Русская":
		$"Меню Настройки/Sprite2D/Озвучка/Желтая рамка/Label Озвучка".text = "Озвучка: Русская"
	elif Global.язык_игры == "ru" and Global.озвучка == "Original":
		$"Меню Настройки/Sprite2D/Озвучка/Желтая рамка/Label Озвучка".text = "Озвучка: Оригинальная"
	elif Global.язык_игры == "en":
		$"Меню Настройки/Sprite2D/Озвучка/Желтая рамка/Label Озвучка".text = "Voice acting: Original"
		
	

##########################   Кнопка Новая игра   #############################################
func _on_новая_игра_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/game.tscn")
		
func _on_area_2d_новая_игра_mouse_entered() -> void:
	$"Главное меню/Sprite2D/Новая игра/Оранжевая рамка".visible = true
func _on_area_2d_новая_игра_mouse_exited() -> void:
	$"Главное меню/Sprite2D/Новая игра/Оранжевая рамка".visible = false

##########################  Кнопка Загрузить ################################################
func _on_загрузить_pressed() -> void:
	pass
	
func _on_area_2d_загрузить_mouse_entered() -> void:
	$"Главное меню/Sprite2D/Загрузить/Оранжевая рамка".visible = true
func _on_area_2d_загрузить_mouse_exited() -> void:
	$"Главное меню/Sprite2D/Загрузить/Оранжевая рамка".visible = false

##########################  Кнопка Сохранить ################################################

func _on_сохранить_pressed() -> void:
	pass 
	
func _on_area_2d_сохранить_mouse_entered() -> void:
	$"Главное меню/Sprite2D/Сохранить/Оранжевая рамка".visible = true
func _on_area_2d_сохранить_mouse_exited() -> void:
	$"Главное меню/Sprite2D/Сохранить/Оранжевая рамка".visible = false

##########################  Кнопка Настройки  ################################################

func _on_настройки_pressed() -> void:
	$"Меню Настройки".visible = true
	$"Главное меню".visible = false
	
func _on_area_2d_настройки_mouse_entered() -> void:
	$"Главное меню/Sprite2D/Настройки/Оранжевая рамка".visible = true
func _on_area_2d_настройки_mouse_exited() -> void:
	$"Главное меню/Sprite2D/Настройки/Оранжевая рамка".visible = false

##########################  Кнопка Карта  ####################################################

func _on_карта_pressed() -> void:
	if Global.игра_запущена == true:
		$".".visible = false
		$"../Карта".visible = true
		$"../CanvasLayer Закрыть карту".visible = true
		Global.карта_включена = true
		
		var start: int = 0
		var end: int = 0
		
		if Global.номер_сцены <= 17:
			Global.отображаемая_карта = "Темный лес"
			start = 0  # Задается диапазон, какие номера карт станут видимы
			end = 17
			$"../CanvasLayer Закрыть карту/Кнопка карта влево".visible = false
			$"../CanvasLayer Закрыть карту/Кнопка карта вправо".visible = false
			if Global.язык_игры == "ru":
				$"../CanvasLayer Закрыть карту/Название карты".text = "Тёмный лес"
			elif Global.язык_игры == "en":
				$"../CanvasLayer Закрыть карту/Название карты".text = "Dark forest"
			if 18 in Global.номера_сцен_в_которых_был_игрок:
				$"../CanvasLayer Закрыть карту/Кнопка карта вправо".visible = true
		elif Global.номер_сцены > 17 and Global.номер_сцены < 30:
			Global.отображаемая_карта = "Строевой лес"
			$"../CanvasLayer Закрыть карту/Название карты".text = "Строевой лес"
			$"../CanvasLayer Закрыть карту/Кнопка карта влево".visible = true
			$"../CanvasLayer Закрыть карту/Кнопка карта вправо".visible = false
			if Global.язык_игры == "ru":
				$"../CanvasLayer Закрыть карту/Название карты".text = "Строевой лес"
			elif Global.язык_игры == "en":
				$"../CanvasLayer Закрыть карту/Название карты".text = "The Timbermist Woods"
			start = 18  # Задается диапазон, какие номера карт станут видимы
			end = 30
		else:
			return  # Если номер сцены 30 и выше, выход из функции
			
		# Сначала делаем все номера карт не видимыми
		for номер_сцены in Global.номера_сцен_в_которых_был_игрок:
			var путь = "../Карта/%d" % номер_сцены
			var узел = get_node_or_null(путь)
			if узел:
				узел.visible = false
		
		# Теперь делаем видимыми только те номера карт, которые в диапазоне
		for номер_сцены in range(start, end + 1):
			if номер_сцены in Global.номера_сцен_в_которых_был_игрок:
				var путь = "../Карта/%d" % номер_сцены
				var узел = get_node_or_null(путь)
				if узел:
					узел.visible = true
	
func _on_area_2d_карта_mouse_entered() -> void:
	$"Главное меню/Sprite2D/Карта/Оранжевая рамка".visible = true
func _on_area_2d_карта_mouse_exited() -> void:
	$"Главное меню/Sprite2D/Карта/Оранжевая рамка".visible = false
	
##########################  Кнопка Выйти из игры  #############################################

func _on_выйти_из_игры_pressed() -> void:
	pass # Replace with function body.
	
func _on_area_2d_выйти_из_игры_mouse_entered() -> void:
	$"Главное меню/Sprite2D/Выйти из игры/Оранжевая рамка".visible = true
func _on_area_2d_выйти_из_игры_mouse_exited() -> void:
	$"Главное меню/Sprite2D/Выйти из игры/Оранжевая рамка".visible = false

##########################  Кнопка Вернуться  #################################################

func _on_вернуться_pressed() -> void:
	if Global.игра_запущена == true:
		$".".visible = false
		Global.меню_игры_открылось = false
		if Global.item_взял == true:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		
		
		
	
func _on_area_2d_вернуться_mouse_entered() -> void:
	$"Главное меню/Sprite2D/Вернуться/Оранжевая рамка".visible = true
func _on_area_2d_вернуться_mouse_exited() -> void:
	$"Главное меню/Sprite2D/Вернуться/Оранжевая рамка".visible = false
	
################################################################################################
################################################################################################
####################################    Меню настройки   #######################################
################################################################################################
################################################################################################

########################################  Кнопка Язык  #########################################

func _on_язык_pressed() -> void:
	if Global.игра_запущена == true:
		if Global.текстовое_поле_под_игровым_окном.text != "":
			if Global.язык_игры == "ru":
				if Global.текстовое_поле_под_игровым_окном.text in Global.обратный_словарь:
					Global.текстовое_поле_под_игровым_окном.text = Global.обратный_словарь[Global.текстовое_поле_под_игровым_окном.text]
			elif Global.язык_игры == "en":
				if Global.текстовое_поле_под_игровым_окном.text in Global.словарь:
					Global.текстовое_поле_под_игровым_окном.text = Global.словарь[Global.текстовое_поле_под_игровым_окном.text]
	
	# Для кнопки Музыка
	if Global.язык_игры == "ru" and Global.музыка_улучшенная == false:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Music: Original"
	elif Global.язык_игры == "ru" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Music: Enhanced"
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == false:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Музыка: Оригинальная"
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Музыка: Улучшенная"
		
	# Для кнопки Текстуры
	if Global.язык_игры == "ru" and Global.текстуры_улучшенные == false:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Textures: Original"
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	elif Global.язык_игры == "ru" and Global.текстуры_улучшенные == true:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Textures: Improved"
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	elif Global.язык_игры == "en" and Global.текстуры_улучшенные == false:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Текстуры: Оригинальные"
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	elif Global.язык_игры == "en" and Global.текстуры_улучшенные == true:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Текстуры: Улучшенные"
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	
	if Global.язык_игры == "ru":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "The Legend of Kyrandia"
		$"Главное меню/Sprite2D/Новая игра/Желтая рамка/Label Новая игра".text = "New game"
		$"Главное меню/Sprite2D/Загрузить/Желтая рамка/Label Загрузить".text = "Load game"
		$"Главное меню/Sprite2D/Сохранить/Желтая рамка/Label Сохранить".text = "Save game"
		$"Главное меню/Sprite2D/Настройки/Желтая рамка/Label Настройки".text = "Settings"
		$"Главное меню/Sprite2D/Карта/Желтая рамка/Label Карта".text = "Map (Key M)"
		$"Главное меню/Sprite2D/Выйти из игры/Желтая рамка/Label Выйти из игры".text = "Exit the game"
		$"Главное меню/Sprite2D/Вернуться/Желтая рамка/Label Вернуться".text = "Return"
		
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Settings"
		$"Меню Настройки/Sprite2D/Язык/Желтая рамка/Label Язык".text = "Language: English"
		$"Меню Настройки/Sprite2D/Озвучка/Желтая рамка/Label Озвучка".text = "Voice acting: Original"
		Global.озвучка = "Original"
		
		
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Желтая рамка/Label Вернуться Настройки".text = "Return"
		Global.язык_игры = "en"
		
	elif Global.язык_игры == "en":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "Легенда о Кирандии"
		$"Главное меню/Sprite2D/Новая игра/Желтая рамка/Label Новая игра".text = "Новая игра"
		$"Главное меню/Sprite2D/Загрузить/Желтая рамка/Label Загрузить".text = "Загрузить"
		$"Главное меню/Sprite2D/Сохранить/Желтая рамка/Label Сохранить".text = "Сохранить"
		$"Главное меню/Sprite2D/Настройки/Желтая рамка/Label Настройки".text = "Настройки"
		$"Главное меню/Sprite2D/Карта/Желтая рамка/Label Карта".text = "Карта (Клавиша M)"
		$"Главное меню/Sprite2D/Выйти из игры/Желтая рамка/Label Выйти из игры".text = "Выйти из игры"
		$"Главное меню/Sprite2D/Вернуться/Желтая рамка/Label Вернуться".text = "Вернуться"
		
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Настройки"
		$"Меню Настройки/Sprite2D/Язык/Желтая рамка/Label Язык".text = "Язык: Русский"
		$"Меню Настройки/Sprite2D/Озвучка/Желтая рамка/Label Озвучка".text = "Озвучка: Оригинальная"
		
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Желтая рамка/Label Вернуться Настройки".text = "Вернуться"
		Global.язык_игры = "ru"
		
	
	
		
		
func _on_area_2d_язык_mouse_entered() -> void:
	$"Меню Настройки/Sprite2D/Язык/Оранжевая рамка".visible = true
func _on_area_2d_язык_mouse_exited() -> void:
	$"Меню Настройки/Sprite2D/Язык/Оранжевая рамка".visible = false

######################################  Кнопка Озвучка  #########################################

func _on_озвучка_pressed() -> void:
	if Global.язык_игры == "ru" and Global.озвучка == "Русская":
		$"Меню Настройки/Sprite2D/Озвучка/Желтая рамка/Label Озвучка".text = "Озвучка: Оригинальная"
		Global.озвучка = "Original"
	elif Global.язык_игры == "ru" and Global.озвучка == "Original":
		$"Меню Настройки/Sprite2D/Озвучка/Желтая рамка/Label Озвучка".text = "Озвучка: Русская"
		Global.озвучка = "Русская"
		
	
	
func _on_area_2d_озвучка_mouse_entered() -> void:
	$"Меню Настройки/Sprite2D/Озвучка/Оранжевая рамка".visible = true
func _on_area_2d_озвучка_mouse_exited() -> void:
	$"Меню Настройки/Sprite2D/Озвучка/Оранжевая рамка".visible = false

######################################  Кнопка Музыка  #########################################

func _on_музыка_pressed() -> void:
	if Global.язык_игры == "ru" and Global.музыка_улучшенная == false:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Музыка: Улучшенная"
		Global.музыка_улучшенная = true
		Global.поменять_музыку = true
		print(Global.музыка_улучшенная)
	elif Global.язык_игры == "ru" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Музыка: Оригинальная"
		Global.музыка_улучшенная = false
		Global.поменять_музыку = true
		print(Global.музыка_улучшенная)
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == false:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Music: Enhanced"
		Global.музыка_улучшенная = true
		Global.поменять_музыку = true
		print(Global.музыка_улучшенная)
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Желтая рамка/Label Музыка".text = "Music: Original"
		Global.музыка_улучшенная = false
		Global.поменять_музыку = true
		print(Global.музыка_улучшенная)
		

func _on_area_2d_музыка_mouse_entered() -> void:
	$"Меню Настройки/Sprite2D/Музыка/Оранжевая рамка".visible = true
func _on_area_2d_музыка_mouse_exited() -> void:
	$"Меню Настройки/Sprite2D/Музыка/Оранжевая рамка".visible = false

######################################  Кнопка Текстуры  #######################################

func _on_текстуры_pressed() -> void:
	if Global.язык_игры == "ru" and Global.текстуры_улучшенные == false:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Текстуры: Улучшенные"
		Global.текстуры_улучшенные = true
		Global.текстуры_поменялись = true
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	elif Global.язык_игры == "ru" and Global.текстуры_улучшенные == true:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Текстуры: Оригинальные"
		Global.текстуры_улучшенные = false
		Global.текстуры_поменялись = true
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	elif Global.язык_игры == "en" and Global.текстуры_улучшенные == false:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Textures: Improved"
		Global.текстуры_улучшенные = true
		Global.текстуры_поменялись = true
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	elif Global.язык_игры == "en" and Global.текстуры_улучшенные == true:
		$"Меню Настройки/Sprite2D/Текстуры/Желтая рамка/Label Текстуры".text = "Textures: Original"
		Global.текстуры_улучшенные = false
		Global.текстуры_поменялись = true
		print("Текстуры улучшенные", Global.текстуры_улучшенные)
	
func _on_area_2d_текстуры_mouse_entered() -> void:
	$"Меню Настройки/Sprite2D/Текстуры/Оранжевая рамка".visible = true
func _on_area_2d_текстуры_mouse_exited() -> void:
	$"Меню Настройки/Sprite2D/Текстуры/Оранжевая рамка".visible = false








########################################  Кнопка Вернуться  #########################################
	
func _on_вернуться_настройки_pressed() -> void:
	$"Главное меню".visible = true
	$"Меню Настройки".visible = false
	
func _on_area_2d_вернуться_настройки_mouse_entered() -> void:
	$"Меню Настройки/Sprite2D/Вернуться Настройки/Оранжевая рамка".visible = true
func _on_area_2d_вернуться_настройки_mouse_exited() -> void:
	$"Меню Настройки/Sprite2D/Вернуться Настройки/Оранжевая рамка".visible = false




		
	
	
	
	
#func _on_touch_screen_button_7_pressed():
#	if Global.game_1_zapushena == false:
#		get_tree().change_scene_to_file("res://Main_menu/main_menu.tscn")
#	elif Global.game_1_zapushena == true:
#		$".".visible = false
#		Global.speed = 500.0
		
		

	
