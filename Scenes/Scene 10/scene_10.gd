extends Sprite2D


var Камень_Перидот
var текст_Брэндона: Label

func _ready():
	Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = false
	Global.нельзя_положить_предмет = false
	Global.номер_сцены = 10
	
	Камень_Перидот = get_node("/root/Game/Итемы/Камень Перидот")
		
	if Global.Херман_находится_в_пещере == false and Global.Херман_спилил_дерево == false and Global.амулет_получил == true:
		Global.Херман_спилил_дерево = true
		Global.Херман_находится_в_пещере = true
		
	if Global.предыдущий_номер_сцены == 9:
		Global.левый_бордер_активный = false
		Global.поменять_музыку = true
	elif Global.предыдущий_номер_сцены == 11:
		Global.верхний_бордер_активный = false
	elif Global.предыдущий_номер_сцены == 15:
		Global.нижний_бордер_активный = false
	
	if 10 not in Global.номера_сцен_в_которых_был_игрок:
		Global.номера_сцен_в_которых_был_игрок.append(10)
	
	if Global.язык_игры == "ru":
		Global.текстовое_поле_под_игровым_окном.text = "Тёмный лес"
	else:
		Global.текстовое_поле_под_игровым_окном.text = "Dark forest"
	
	Global.cursor_strelka_left = true
	Global.cursor_strelka_right = false
	Global.cursor_strelka_up = true
	Global.cursor_strelka_down = true
	
func _process(delta: float) -> void:
	if Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации == false:
		if Global.предыдущий_номер_сцены == 9:
			if Global.player.global_position == Vector2(132, 624): 
				Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = true
				if Global.было_падение_зеленого_листа == true:
					Global.заблокировать_ввод = false
				if Global.было_падение_зеленого_листа == false:
					Global.было_падение_зеленого_листа = true
					$VideoStreamPlayer.visible = true
					$VideoStreamPlayer.play()
		# Если пришел в локацию сверху или снизу. Это нужно доделать!!! Сейчас временная заглушка стоит
		else:
			Global.Брэндон_пришел_в_стартовое_положение_после_смены_локации = true
			Global.заблокировать_ввод = false
		

func _on_video_stream_player_finished() -> void:
	Камень_Перидот.global_position = Vector2 (942, 528)
	$VideoStreamPlayer.visible = false
	Global.заблокировать_ввод = false
	Global.is_moving = true
	
	
	
