extends Sprite2D

var код_был_запущен_1_раз: bool = false
#var номер_сообщения: int = 1
#var текст_Брэндона: Label

#var пила_находится_в_зоне_куда_его_нужно_установить: bool = false
var запустить_анимацию_3_отдал_пилу: bool = false

var Пила

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 17
	
	#$"Текст Хермана".global_position = Vector2 (900, 30)
	#текст_Брэндона = get_node("/root/Game/player/Текст Брэндона")
	
		
	
	if Global.Херман_находится_в_пещере == true and Global.Херман_спилил_дерево == true:
		$"Sprite2D Херман 1".visible = false
		$"Sprite2D Херман 1".visible = false
		$"Sprite2D Херман после того как отремонтировал мост".visible = true
		$"Анимация воды мост сломан".visible = false
		$"Анимация воды мост починен".visible = true
	elif Global.Херман_находится_в_пещере == false:
		$"Area2D Херман".visible = false
		$"Sprite2D Херман 1".visible = false
		$"Sprite2D Херман 2".visible = false
	elif Global.Херман_находится_в_пещере == true and Global.Херман_спилил_дерево == false:
		$"Area2D Херман".visible = true
		$"Sprite2D Херман 1".visible = true
		$"Sprite2D Херман 2".visible = false
		
		
	if Global.предыдущий_номер_сцены == 16:
		Global.правый_бордер_активный = false
		Global.заблокировать_ввод = true
	elif Global.предыдущий_номер_сцены == 18:
		Global.левый_бордер_активный = false
		
	Global.поменять_музыку = true
	
	Пила = get_node("/root/Game/Итемы/Пила")
	
	if 17 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(17)
	
	if Global.Херман_спилил_дерево == true:
		if Global.язык_игры == "ru":
			Global.текстовое_поле_под_игровым_окном.text = "Шаткий мостик"
		else:
			Global.текстовое_поле_под_игровым_окном.text = "A rickety bridge"
	elif Global.Херман_спилил_дерево == false:
		if Global.язык_игры == "ru":
			Global.текстовое_поле_под_игровым_окном.text = "Поломанный мост"
		else:
			Global.текстовое_поле_под_игровым_окном.text = "A ruined bridge"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
	
	
	if Global.Херман_спилил_дерево == false:
		$".".texture = preload("res://Scenes/Scene 17/17 Оригинал.png")
	elif Global.Херман_спилил_дерево == true:
		$".".texture = preload("res://Scenes/Scene 17/17 Оригинал мост отремонтирован.png")
		$StaticBody2D/CollisionShape2D.disabled = true
		$StaticBody2D/CollisionShape2D3.disabled = true
	
	
		
func _process(delta: float) -> void:
	if Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации == false:
		if Global.предыдущий_номер_сцены == 16:
			if Global.player.global_position == Vector2(1692, 504): 
				#Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = true
				#Global.заблокировать_ввод = false
				if Global.последнее_сообщение_Хермана == "" or Global.последнее_сообщение_Хермана == "Это не моя ошибка!":
					Global.заблокировать_ввод = true
					$"VideoStreamPlayer Первая заставка".visible = true
					$"VideoStreamPlayer Первая заставка".play()
				elif Global.последнее_сообщение_Хермана == "Вторая заставка":
					Global.заблокировать_ввод = true
					$"VideoStreamPlayer Четвертая заставка Херман спрашивает про пилу".visible = true
					$"VideoStreamPlayer Четвертая заставка Херман спрашивает про пилу".play()
				elif Global.Херман_находится_в_пещере == true and Global.Херман_спилил_дерево == true:
					Global.заблокировать_ввод = true
					$"VideoStreamPlayer Пятая заставка Херман починил мост".visible = true
					$"VideoStreamPlayer Пятая заставка Херман починил мост".play()
				else:
					Global.заблокировать_ввод = false
				Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = true	
		# Если пришел в локацию сверху или снизу. Это нужно доделать!!! Сейчас временная заглушка стоит
		else:
			Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = true
			Global.заблокировать_ввод = false
	
	
		
	
	if Global.запустить_заставку_с_Херманом == true:
		Global.запустить_заставку_с_Херманом = false
		Global.заблокировать_ввод = true
		if Global.последнее_сообщение_Хермана == "Это не моя ошибка!":
			$"VideoStreamPlayer Вторая заставка".visible = true
			$"VideoStreamPlayer Вторая заставка".play()
		elif Global.последнее_сообщение_Хермана == "Вторая заставка":
			$"VideoStreamPlayer Третья заставка".visible = true
			$"VideoStreamPlayer Третья заставка".play()
		

	
func _on_area_2d_херман_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Global.карта_включена == false and Global.меню_игры_открылось == false:
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			if Global.item_взял == true:
				return
			else:
				if Global.последнее_сообщение_Хермана == "Это не моя ошибка!":
					Global.брэндон_идет_в_координату_в_которой_запустится_заставка = true
				

func _on_video_stream_player_первая_заставка_finished() -> void:
	Global.заблокировать_ввод = false
	$"VideoStreamPlayer Первая заставка".visible = false
	Global.последнее_сообщение_Хермана = "Это не моя ошибка!"
	$"Sprite2D Херман 1".visible = false
	$"Sprite2D Херман 2".visible = true


func _on_video_stream_player_вторая_заставка_finished() -> void:
	Global.заблокировать_ввод = false
	$"VideoStreamPlayer Вторая заставка".visible = false
	Global.последнее_сообщение_Хермана = "Вторая заставка"
	$"Sprite2D Херман 1".visible = false
	$"Sprite2D Херман 2".visible = true


func _on_video_stream_player_третья_заставка_finished() -> void:
	Global.заблокировать_ввод = false
	$"VideoStreamPlayer Третья заставка".visible = false
	Global.последнее_сообщение_Хермана = "Третья заставка"
	$"Sprite2D Херман 1".visible = false
	$"Sprite2D Херман 2".visible = false
	$"Area2D Херман".visible = false
	Global.Херман_находится_в_пещере = false 
	Global.Херман_спилил_дерево = false
	
	


func _on_video_stream_player_четвертая_заставка_херман_спрашивает_про_пилу_finished() -> void:
	Global.заблокировать_ввод = false
	$"VideoStreamPlayer Четвертая заставка Херман спрашивает про пилу".visible = false
	$"Sprite2D Херман 1".visible = false
	$"Sprite2D Херман 2".visible = true
	
	
	


func _on_video_stream_player_пятая_заставка_херман_починил_мост_finished() -> void:
	Global.заблокировать_ввод = false
	$"Area2D Херман".visible = false
	$"Sprite2D Херман 1".visible = false
	$"Sprite2D Херман 2".visible = false
	$"Sprite2D Херман после того как отремонтировал мост".visible = false
	Global.Херман_находится_в_пещере = false
	Global.Херман_спилил_дерево = true
	
	
	
