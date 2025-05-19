extends Sprite2D

var счетчик_основной_анимации_Херман_пилит_дерево: int = 0
var остановить_анимацию_как_Херман_пилит_дерево: bool = false

var номер_сообщения: int = 1
var текст_Брэндона: Label

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 15
	
	текст_Брэндона = get_node("/root/Game/player/Текст Брэндона")
	$"Текст Хермана".global_position = Vector2 (200, 100)
	
	if Global.Херман_находится_в_пещере == false and Global.Херман_спилил_дерево == false:
		$"Херман пилит дерево".visible = true
		$"Херман пилит дерево".play("default")
		$"AudioStreamPlayer Херман пилит дерево аудио".play()
	else:
		$"Херман пилит дерево".visible = false
		
		
	if Global.предыдущий_номер_сцены == 10:
		Global.верхний_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 16:
		Global.нижний_бордер_активный = false
		
	if 15 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(15)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Каменная гряда"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "A rocky outcropping"
	
	
	Global.cursor_strelka_left = false
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = true
	Global.cursor_strelka_down = true
	
	if Global.Херман_спилил_дерево == false:
		$".".texture = preload("res://Scenes/Scene 15/15 Оригинал.png")
	else:
		$".".texture = preload("res://Scenes/Scene 15/15 Оригинал дерево спилено.png")
		
func _process(delta: float) -> void:

	if Global.запустить_заставку_с_Херманом == true:
		Global.запустить_заставку_с_Херманом = false
		$"Херман пилит дерево".visible = false
		$"Отвлекаю Хермана когда он пилит дерево".visible = true
		$"Отвлекаю Хермана когда он пилит дерево".play("default")
		$"Timer время до появления сообщения".wait_time = 0.3
		$"Timer время до появления сообщения".start()
		

func _on_херман_пилит_дерево_animation_finished() -> void:
	if счетчик_основной_анимации_Херман_пилит_дерево <= 5:
		if остановить_анимацию_как_Херман_пилит_дерево == false:
			счетчик_основной_анимации_Херман_пилит_дерево += 1
			$"Херман пилит дерево".play("default")
			$"AudioStreamPlayer Херман пилит дерево аудио".play()
		#elif Global.запустить_заставку_с_Херманом == true:
		#	Global.запустить_заставку_с_Херманом = false
		#	$"Херман пилит дерево".visible = false
		#	$"Отвлекаю Хермана когда он пилит дерево".visible = true
		#	$"Отвлекаю Хермана когда он пилит дерево".play("default")
	elif счетчик_основной_анимации_Херман_пилит_дерево > 5:
		счетчик_основной_анимации_Херман_пилит_дерево = 0
		$"Херман пилит дерево".visible = false
		$"Херман пилит дерево короткая анимация".visible = true
		$"Херман пилит дерево короткая анимация".play("default")
		
		
func _on_херман_пилит_дерево_короткая_анимация_animation_finished() -> void:
	$"Херман пилит дерево короткая анимация".visible = false
	$"Херман пилит дерево".visible = true
	$"Херман пилит дерево".play("default")
	$"AudioStreamPlayer Херман пилит дерево аудио".play()

func _on_area_2d_херман_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			номер_сообщения = 1
			остановить_анимацию_как_Херман_пилит_дерево = true
			Global.брэндон_идет_в_координату_в_которой_запустится_заставка = true
			

func _on_отвлекаю_хермана_когда_он_пилит_дерево_animation_finished() -> void:
	$"Отвлекаю Хермана когда он пилит дерево".visible = false
	$"Херман пилит дерево".visible = true
	остановить_анимацию_как_Херман_пилит_дерево = false
	счетчик_основной_анимации_Херман_пилит_дерево = 1
	$"Херман пилит дерево".play("default")
	$"AudioStreamPlayer Херман пилит дерево аудио".play()
	Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
	Global.заблокировать_ввод = false
	Global.is_moving = true


func _on_timer_время_до_появления_сообщения_timeout() -> void:
	if номер_сообщения == 1:
		$"AudioStreamPlayer Almost finished".play()
		if Global.язык_игры == "en":
			текст_Брэндона.text = "Almost finished?"
		elif Global.язык_игры == "ru":
			текст_Брэндона.text = "Почти закончил?"
		$"Timer время до появления сообщения".wait_time = 2.5
		$"Timer время до появления сообщения".start()
		$"Timer длительность отображения сообщения".wait_time = 2.3
		$"Timer длительность отображения сообщения".start()
	elif номер_сообщения == 2:
		$"AudioStreamPlayer Вторая часть диалога".play()
		if Global.язык_игры == "en":
			$"Текст Хермана".text = "Oh, so no you're\nin a hurry."
		elif Global.язык_игры == "ru":
			$"Текст Хермана".text = "Эту твою пилу можно использовать\nкак точилку."
		$"Timer время до появления сообщения".wait_time = 2.2
		$"Timer время до появления сообщения".start()
		$"Timer длительность отображения сообщения".wait_time = 2.0
		$"Timer длительность отображения сообщения".start()
	elif номер_сообщения == 3:
		if Global.язык_игры == "en":
			$"Текст Хермана".text = "Dom't you have something\nelse to do?"
		elif Global.язык_игры == "ru":
			$"Текст Хермана".text = "Тебе больше нечего делать?"
		$"Timer время до появления сообщения".wait_time = 2.2
		$"Timer время до появления сообщения".start()
		$"Timer длительность отображения сообщения".wait_time = 2.0
		$"Timer длительность отображения сообщения".start()
	elif номер_сообщения == 4:
		if Global.язык_игры == "en":
			текст_Брэндона.text = "Okay, I'll come back later."
		elif Global.язык_игры == "ru":
			текст_Брэндона.text = "Хорошо, я приду позже."
		$"Timer длительность отображения сообщения".wait_time = 2.0
		$"Timer длительность отображения сообщения".start()
	номер_сообщения += 1	


func _on_timer_длительность_отображения_сообщения_timeout() -> void:
	$"Текст Хермана".text = ""
	текст_Брэндона.text = ""
