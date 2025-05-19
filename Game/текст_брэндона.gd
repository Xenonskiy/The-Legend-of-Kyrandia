extends Label

const MAX_LINES = 3
const LINE_HEIGHT = 16  # Размер шрифта + межстрочный интервал
const MAX_WIDTH = 700   # Ограничение ширины текста 

func _ready():
	Global.координата_текстового_поля_брэндона = $"."
	set_text_with_lines("")
	#position.y -= 140  # Поднимаю текст над Брэндоном
	Global.координата_текстового_поля_брэндона.position.y -= 170
	print("position  ",$".".position)
	print("global_position  ", $".".global_position)
	
func _process(delta: float) -> void:
	var viewport = get_viewport()
	var viewport_width = viewport.size.x
	var text_width = size.x

	# Получаем игрока (родителя лейбла)
	var player = get_parent()
	var player_global_x = player.global_position.x

	# Желаемая позиция X для центрирования текста относительно игрока
	var desired_x = -text_width / 2

	# Рассчитываем глобальные границы текста
	var global_text_left = player_global_x + desired_x
	var global_text_right = global_text_left + text_width

	# Заданные границы
	var left_boundary = 45
	var right_boundary = 1850

	# Корректируем позицию, если текст выходит за левую границу
	if global_text_left < left_boundary:
		desired_x += (left_boundary - global_text_left)  # Сдвигаем вправо до левой границы

	# Корректируем позицию, если текст выходит за правую границу
	if global_text_right > right_boundary:
		desired_x -= (global_text_right - right_boundary)  # Сдвигаем влево до правой границы

	# Обновляем позицию текста
	position.x = desired_x
	
		
		
	
func set_text_with_lines(new_text: String):
	text = new_text
	autowrap_mode = TextServer.AUTOWRAP_WORD  # Включаем перенос строк
	size_flags_horizontal = SIZE_SHRINK_END  # Не растягиваем по ширине
	
	custom_minimum_size.x = MAX_WIDTH  # Ограничение ширины
	
	await get_tree().process_frame  # Ждём, пока обновится размер текста

	var line_count = get_line_count()

	# Принудительно устанавливаем высоту текста, чтобы он не сжимался до высоты 1 строки
	custom_minimum_size.y = max(line_count, 1) * LINE_HEIGHT
	
	# Устанавливаем выравнивание текста по низу
	vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
