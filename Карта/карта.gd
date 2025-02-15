extends Sprite2D

var min_zoom: float = 0.27451 # Минимальный зум 
var max_zoom: float = 4.0   # Максимальный зум (400%)
var zoom_speed: float = 50.0 # Скорость зума

var target_zoom: float = 1.0 # Целевой зум
var dragging: bool = false   # Флаг для перемещения
var last_mouse_position: Vector2 # Последняя позиция мыши

func _ready():
	# Убедимся, что спрайт изначально находится в пределах экрана
	position = get_clamped_position(position)
	
func _process(delta):
	
	
	# Сглаживание изменения масштаба с помощью lerp
	scale.x = lerp(scale.x, target_zoom, zoom_speed * delta)
	scale.y = lerp(scale.y, target_zoom, zoom_speed * delta)

	# Ограничение масштаба
	scale.x = clamp(scale.x, min_zoom, max_zoom)
	scale.y = clamp(scale.y, min_zoom, max_zoom)

	# После изменения масштаба обновляем позицию, чтобы спрайт не выходил за границы
	position = get_clamped_position(position)

	# Перемещение изображения при зажатой левой кнопке мыши
	if dragging:
		var mouse_position = get_global_mouse_position()
		var delta_position = mouse_position - last_mouse_position

		# Предварительно ограничиваем новую позицию до обновления
		var new_position = position + delta_position
		position = get_clamped_position(new_position)

		# Обновляем последнюю позицию мыши после клэмпинга
		last_mouse_position = get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			# Сохраняем текущую позицию мыши в локальных координатах спрайта
			var local_mouse_pos = (get_global_mouse_position() - position) / scale

			# Меняем зум
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				target_zoom += 0.03
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				target_zoom -= 0.03

			# Ограничение целевого зума
			target_zoom = clamp(target_zoom, min_zoom, max_zoom)

			# Обновляем позицию так, чтобы спрайт масштабировался относительно мыши
			var new_scale = Vector2(target_zoom, target_zoom)
			position += local_mouse_pos * (scale - new_scale)
			scale = new_scale

		# Обработка нажатия и отпускания левой кнопки мыши
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				last_mouse_position = get_global_mouse_position()
			else:
				dragging = false

func get_clamped_position(new_position: Vector2) -> Vector2:
	# Получаем размер окна и текстуры
	var viewport_size = get_viewport_rect().size
	var texture_size = texture.get_size() * scale

	# Рассчитываем границы экрана
	var left_bound = 0
	var right_bound = viewport_size.x
	var top_bound = 0
	var bottom_bound = viewport_size.y

	# Рассчитываем допустимые границы для спрайта
	var clamped_x = clamp(new_position.x, left_bound - (texture_size.x - viewport_size.x), left_bound)
	var clamped_y = clamp(new_position.y, top_bound - (texture_size.y - viewport_size.y), top_bound)

	return Vector2(clamped_x, clamped_y)
