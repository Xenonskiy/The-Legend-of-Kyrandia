extends Node2D

func _ready():
	$VideoStreamPlayer.play()
	$Timer.start()
	$Timer2.start()
	$Timer3.start()
	
	if Global.язык_игры == "en":
		$Sprite2D/Label.text = "Skip intro?"
		$"Sprite2D/Label Да".text = "Yes"
		$"Sprite2D/Label Нет".text = "No"
	
func _on_touch_screen_button_pressed() -> void:
	$Sprite2D.visible = true
	$TouchScreenButton.visible = false

func _on_touch_screen_button_да_pressed() -> void:
	get_tree().change_scene_to_file("res://Game/game.tscn")

func _on_touch_screen_button_нет_pressed() -> void:
	$Sprite2D.visible = false
	$TouchScreenButton.visible = true
	
func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://Game/game.tscn")
	
func _on_timer_timeout() -> void:
	$Sprite2D2.visible = true
	$Sprite2D3.visible = true

func _on_timer_2_timeout() -> void:
	$Sprite2D2.visible = false
	

func _on_timer_3_timeout() -> void:
	#$Sprite2D3.visible = false
	$Sprite2D3.visible = false
