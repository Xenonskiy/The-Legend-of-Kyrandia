extends Node2D


func _ready():
	
	if Global.язык_игры == "ru":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "Легенда о Кирандии"
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Настройки"
		$"Главное меню/Sprite2D/Настройки/Label Настройки".text = "Настройки"
		$"Главное меню/Sprite2D/Карта/Label Карта".text = "Карта"
		$"Главное меню/Sprite2D/Выйти из игры/Label Выйти из игры".text = "Выйти"
		$"Главное меню/Sprite2D/Вернуться/Label Вернуться".text = "Вернуться"
		$"Меню Настройки/Sprite2D/Язык/Label Язык".text = "  Язык:\nРусский"
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Label Вернуться Настройки".text = "Вернуться"
		if Global.музыка_улучшенная == false:
			$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = " Музыка:\nОригинал"
		elif Global.музыка_улучшенная == true:
			$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = "   Музыка:\nУлучшенная"
		
		
	elif Global.язык_игры == "en":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "The Legend of Kyrandia"
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Settings"
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "The Legend of Kyrandia"
		$"Главное меню/Sprite2D/Настройки/Label Настройки".text = "Settings"
		$"Главное меню/Sprite2D/Карта/Label Карта".text = "Map"
		$"Главное меню/Sprite2D/Выйти из игры/Label Выйти из игры".text = "Exit"
		$"Главное меню/Sprite2D/Вернуться/Label Вернуться".text = "Return"
		$"Меню Настройки/Sprite2D/Язык/Label Язык".text = "Language:\n  English"
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Label Вернуться Настройки".text = "Return"
		if Global.музыка_улучшенная == false:
			$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = " Music:\nOriginal"
		elif Global.музыка_улучшенная == true:
			$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = "   Music:\nEnhanced"
		
		



##########################  Кнопка Настройки  ################################################

func _on_настройки_pressed() -> void:
	$"Меню Настройки".visible = true
	$"Главное меню".visible = false
	
##########################  Кнопка Карта  ####################################################

func _on_карта_pressed() -> void:
	if Global.игра_запущена == true:
		Global.меню_игры_открылось = true # Чтобы игрок при закрытии карты не двигался
		Global.карта_включена = true
		$".".visible = false
		$"../Node2D Карта".visible = true
		$"../Node2D Карта/CanvasLayer Закрыть карту".visible = true
		if Global.язык_игры == "en":
			$"../Node2D Карта/Label Тёмный лес".text = "Dark forest"
			$"../Node2D Карта/Label Южный утес".text = "A southern cliff"
			$"../Node2D Карта/Label Дом Дарма".text = "Darm's House"
		elif Global.язык_игры == "ru":
			$"../Node2D Карта/Label Тёмный лес".text = "Тёмный лес"
			$"../Node2D Карта/Label Южный утес".text = "Южный утёс"
			$"../Node2D Карта/Label Дом Дарма".text = "Дом Дарма"
		
		if Global.номер_сцены == 1:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 180)
		elif Global.номер_сцены == 2:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 298)
		elif Global.номер_сцены == 3:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 416)
		elif Global.номер_сцены == 3:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 416)
		elif Global.номер_сцены == 4:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (801, 416)
		elif Global.номер_сцены == 5:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (683, 416)
		elif Global.номер_сцены == 6:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (683, 298)
		elif Global.номер_сцены == 7:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (565, 298)
		elif Global.номер_сцены == 8:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1037, 416)
		elif Global.номер_сцены == 9:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1155, 416)
		elif Global.номер_сцены == 10:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 416)
		elif Global.номер_сцены == 11:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 298)
		elif Global.номер_сцены == 12:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1391, 298)
		elif Global.номер_сцены == 13:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1509, 298)
		elif Global.номер_сцены == 14:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1155, 298)
		elif Global.номер_сцены == 15:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 534)
		elif Global.номер_сцены == 16:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1273, 652)
		elif Global.номер_сцены == 17:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (1155, 652)
		elif Global.номер_сцены == 18:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (919, 180)
		elif Global.номер_сцены == 19:
			$"../Node2D Карта/Рамка показывающая где игрок на карте".global_position = Vector2 (801, 180)
		
		if Global.номер_сцены <= 17:
			$"../Node2D Карта/Карта".texture = preload("res://Карта/Карта Глава первая.png")
			if Global.язык_игры == "ru":
				$"../Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "Тёмный лес"
			elif Global.язык_игры == "en":
				$"../Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "Dark forest"
			$"../Node2D Карта/Квадрат сцена 18".visible = false
			$"../Node2D Карта/Sprite2D Темный лес".visible = false
			$"../Node2D Карта/Label Тёмный лес".visible = false
			$"../Node2D Карта/Sprite2D Южный утес".visible = false
			$"../Node2D Карта/Label Южный утес".visible = false
			$"../Node2D Карта/Sprite2D Дом Дарма".visible = false
			$"../Node2D Карта/Label Дом Дарма".visible = false
			
			# Для отображения значков локаций
			if 8 in Global.номера_сцен_в_которых_был_игрок or 10 in Global.номера_сцен_в_которых_был_игрок or 11 in Global.номера_сцен_в_которых_был_игрок or 14 in Global.номера_сцен_в_которых_был_игрок:
				$"../Node2D Карта/Sprite2D Темный лес".visible = true
				$"../Node2D Карта/Label Тёмный лес".visible = true
			if 5 in Global.номера_сцен_в_которых_был_игрок:
				$"../Node2D Карта/Sprite2D Южный утес".visible = true
				$"../Node2D Карта/Label Южный утес".visible = true
			
			for i in range(2, 18):
				if i in Global.номера_сцен_в_которых_был_игрок:
					get_node("../Node2D Карта/Квадрат сцена %d" % i).visible = false
			
		
		elif Global.номер_сцены >= 18:
			$"../Node2D Карта/Карта".texture = preload("res://Карта/Карта Глава вторая.png")
			if Global.язык_игры == "ru":
				$"../Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "Строевой лес"
			elif Global.язык_игры == "en":
				$"../Node2D Карта/CanvasLayer Закрыть карту/Название карты".text = "The Timbermist Woods"
			$"../Node2D Карта/Sprite2D Темный лес".visible = false
			$"../Node2D Карта/Label Тёмный лес".visible = false
			$"../Node2D Карта/Sprite2D Южный утес".visible = false
			$"../Node2D Карта/Label Южный утес".visible = false
			$"../Node2D Карта/Sprite2D Дом Дарма".visible = false
			$"../Node2D Карта/Label Дом Дарма".visible = false
			
			# Для отображения значков локаций
			if 18 in Global.номера_сцен_в_которых_был_игрок:
				$"../Node2D Карта/Sprite2D Темный лес".visible = true
				$"../Node2D Карта/Label Тёмный лес".visible = true
			if 19 in Global.номера_сцен_в_которых_был_игрок:
				$"../Node2D Карта/Sprite2D Дом Дарма".visible = true
				$"../Node2D Карта/Label Дом Дарма".visible = true
			
			for i in range(18, 20):
				if i in Global.номера_сцен_в_которых_был_игрок:
					get_node("../Node2D Карта/Квадрат сцена %d" % i).visible = false
		

##########################  Кнопка Выйти из игры  #############################################

func _on_выйти_из_игры_pressed() -> void:
	get_tree().quit()
	
##########################  Кнопка Вернуться  #################################################

func _on_вернуться_pressed() -> void:
	if Global.игра_запущена == true:
		$".".visible = false
		Global.меню_игры_открылось = false
		Global.меню_открылось = false
		if Global.item_взял == true:
			Input.set_custom_mouse_cursor(Global.cursor_with_item)
		
		
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
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = " Music:\nOriginal"
	elif Global.язык_игры == "ru" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = "   Music:\nEnhanced"
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == false:
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = " Музыка:\nОригинал"
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = "   Музыка:\nУлучшенная"
		

	
	if Global.язык_игры == "ru":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "The Legend of Kyrandia"
		$"Главное меню/Sprite2D/Настройки/Label Настройки".text = "Settings"
		$"Главное меню/Sprite2D/Карта/Label Карта".text = "Map"
		$"Главное меню/Sprite2D/Выйти из игры/Label Выйти из игры".text = "Exit"
		$"Главное меню/Sprite2D/Вернуться/Label Вернуться".text = "Return"
		
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Settings"
		$"Меню Настройки/Sprite2D/Язык/Label Язык".text = "Language:\n  English"
		
		
		
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Label Вернуться Настройки".text = "Return"
		Global.язык_игры = "en"
		
	elif Global.язык_игры == "en":
		$"Главное меню/Sprite2D/Label Шапка меню игры".text = "Легенда о Кирандии"
		$"Главное меню/Sprite2D/Настройки/Label Настройки".text = "Настройки"
		$"Главное меню/Sprite2D/Карта/Label Карта".text = "Карта"
		$"Главное меню/Sprite2D/Выйти из игры/Label Выйти из игры".text = "Выйти"
		$"Главное меню/Sprite2D/Вернуться/Label Вернуться".text = "Вернуться"
		
		$"Меню Настройки/Sprite2D/Label Шапка меню игры".text = "Настройки"
		$"Меню Настройки/Sprite2D/Язык/Label Язык".text = "  Язык:\nРусский"
				
		$"Меню Настройки/Sprite2D/Вернуться Настройки/Label Вернуться Настройки".text = "Вернуться"
		Global.язык_игры = "ru"
		
######################################  Кнопка Музыка  #########################################

func _on_музыка_pressed() -> void:
	if Global.язык_игры == "ru" and Global.музыка_улучшенная == false:
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = "   Музыка:\nУлучшенная"
		Global.музыка_улучшенная = true
		Global.поменять_музыку = true
	elif Global.язык_игры == "ru" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = " Музыка:\nОригинал"
		Global.музыка_улучшенная = false
		Global.поменять_музыку = true
		
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == false:
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = "   Music:\nEnhanced"
		Global.музыка_улучшенная = true
		Global.поменять_музыку = true
		
	elif Global.язык_игры == "en" and Global.музыка_улучшенная == true:
		$"Меню Настройки/Sprite2D/Музыка/Label Музыка".text = " Music:\nOriginal"
		Global.музыка_улучшенная = false
		Global.поменять_музыку = true
		
########################################  Кнопка Вернуться  #########################################
	
func _on_вернуться_настройки_pressed() -> void:
	$"Главное меню".visible = true
	$"Меню Настройки".visible = false
