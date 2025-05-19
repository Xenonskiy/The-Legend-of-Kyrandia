extends Label

const LINE_HEIGHT = 16  # Размер шрифта + межстрочный интервал
const MAX_WIDTH = 800   # Ограничение ширины текста


func _ready():
	set_text_with_lines("")


func set_text_with_lines(new_text: String):
	text = new_text
	#autowrap_mode = TextServer.AUTOWRAP_WORD  # Включаем перенос строк
	size_flags_horizontal = SIZE_SHRINK_END  # Не растягиваем по ширине

	custom_minimum_size.x = MAX_WIDTH  # Ограничение ширины

	# Принудительно устанавливаем высоту текста, чтобы он не сжимался до высоты 1 строки
	var line_count = get_line_count()
	custom_minimum_size.y = max(line_count, 1) * LINE_HEIGHT

	# Устанавливаем выравнивание текста
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	
	# Задание цвета текста
	self.add_theme_color_override("font_color", Color(1.0, 0.8706, 0.5804))
