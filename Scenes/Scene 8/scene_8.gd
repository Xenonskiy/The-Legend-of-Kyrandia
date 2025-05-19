extends Sprite2D

var Брэндон_пришел_в_стартовую_позицию = false

#var текст_Брэндона: Label
var player

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 8
	
	
	#текст_Брэндона = get_node("/root/Game/player/Текст Брэндона")
	player = get_node("/root/Game/player")
		
	if Global.в_сцене_8_должна_быть_заставка_с_Миритом == true:
		$"Sprite2D Мирит".visible = true
		
	if Global.предыдущий_номер_сцены == 3:
		Global.левый_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 9:
		Global.правый_бордер_активный = false
		Global.поменять_музыку = true
	
	if 8 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(8)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Тёмный лес"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Dark forest"
	
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = true
	Global.cursor_strelka_up = false
	Global.cursor_strelka_down = false
	
			
func _process(delta: float) -> void:
	# Когда Брэндон достигнет стартовой позиции в этой локации, разблокируется управление
	if Брэндон_пришел_в_стартовую_позицию == false:
		if Global.player.global_position == Vector2(252, 516):
			Global.заблокировать_ввод = false
			Брэндон_пришел_в_стартовую_позицию = true
	
	if Global.в_сцене_8_должна_быть_заставка_с_Миритом == true and player.global_position == Vector2(252, 516):
		Global.в_сцене_8_должна_быть_заставка_с_Миритом = false
		Global.заблокировать_ввод = true
		$"Sprite2D Мирит".visible = false
		$"VideoStreamPlayer Заставка с Миритом".visible = true
		$"VideoStreamPlayer Заставка с Миритом".play()
		
func _on_video_stream_player_заставка_с_миритом_finished() -> void:
	$"VideoStreamPlayer Заставка с Миритом".visible = false
	#Global.координаты_клика_мыши_сделать_равными_координате_игрока = true
	Global.заблокировать_ввод = false
	Global.is_moving = true
	Global.в_сцене_9_должна_быть_заставка_с_Миритом = true
	
	
	
