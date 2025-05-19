extends Sprite2D

var player
var Мрамор

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 11
	
	if Global.в_сцене_11_или_13_нужно_запустить_заново_музыку == true:
		Global.в_сцене_11_или_13_нужно_запустить_заново_музыку = false
		Global.запустить_музыку = true
		
	player = get_node("/root/Game/player")
	Мрамор = get_node("/root/Game/Итемы/Мрамор")
	
	if Global.в_сцене_11_должна_быть_заставка_с_Миритом == true:
		$"Sprite2D Мирит".visible = true
		
	if Global.предыдущий_номер_сцены == 10:
		Global.нижний_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 12:
		Global.правый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 14:
		Global.левый_бордер_активный = false
	
	if 11 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(11)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Тёмный лес"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Dark forest"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = true
	

		
func _process(delta: float) -> void:
	if Global.в_сцене_11_должна_быть_заставка_с_Миритом == true and player.global_position == Vector2(996, 648):
		Global.в_сцене_11_должна_быть_заставка_с_Миритом = false
		player.global_position = Vector2 (996, 540)
		Global.заблокировать_ввод = true
		Global.остановить_музыку = true
		$"Sprite2D Мирит".visible = false
		$VideoStreamPlayer.visible = true
		$VideoStreamPlayer.play()
		$"Timer для запуска музыки".start()
		

func _on_video_stream_player_finished() -> void:
	$VideoStreamPlayer.visible = false
	Мрамор.global_position = Vector2 (822, 606)
	Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
	Global.заблокировать_ввод = false
	Global.is_moving = true


func _on_timer_для_запуска_музыки_timeout() -> void:
	Global.запустить_музыку = true
