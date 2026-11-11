extends Control

@onready var adder: Adder = %Adder
@onready var line_edit_x: LineEdit = %LineEditX
@onready var line_edit_y: LineEdit = %LineEditY
@onready var line_edit_offset: LineEdit = %LineEditOffset
@onready var line_edit_result: LineEdit = %LineEditResult
@onready var rounded: CheckBox = %Rounded


func _ready() -> void:
	adder.added.connect(_on_adder_added)
	line_edit_x.text_changed.connect(_on_input_text_changed)
	line_edit_y.text_changed.connect(_on_input_text_changed)
	line_edit_offset.text_changed.connect(_on_input_text_changed)
	rounded.toggled.connect(_on_rounded_toggled)
	_update()


func _on_rounded_toggled(toggled_on: bool) -> void:
	adder.rounded = toggled_on
	_update()


func _on_input_text_changed(_new_text: String) -> void:
	_update()


func _on_adder_added(result: float) -> void:
	line_edit_result.text = str(result)


func _update() -> void:
	adder.offset = _read(line_edit_offset)
	adder.add(_read(line_edit_x), _read(line_edit_y))


func _read(line_edit: LineEdit) -> float:
	return line_edit.text.to_float() if line_edit.text.is_valid_float() else 0.0
