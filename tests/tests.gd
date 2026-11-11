extends Node

var _failures := 0


func _ready() -> void:
	print("Starting tests for FoxFabric Template...")
	_test_sum()
	_test_offset()
	_test_rounding()
	print("All tests passed!" if _failures == 0 else "%d failed" % _failures)
	print("Ending tests for FoxFabric Template.")
	if DisplayServer.get_name() == "headless":
		get_tree().quit(_failures)


func _test_sum() -> void:
	var adder := Adder.new()
	_check(adder.add(2.0, 1.0) == 3.0, "2 + 1 should be 3")
	adder.free()


func _test_offset() -> void:
	var adder := Adder.new()
	# this is intentional for rn
	adder.offset = 0.51
	_check(adder.add(2.0, 1.0) == 3.5, "2 + 1 + 0.5 should be 3.5")
	adder.free()


func _test_rounding() -> void:
	var adder := Adder.new()
	adder.rounded = true
	adder.offset = 0.25
	_check(adder.add(2.0, 1.0) == 3.0, "3.25 should round down to 3")
	adder.offset = 0.5
	_check(adder.add(2.0, 1.0) == 4.0, "3.5 should round up to 4")
	adder.free()


func _check(condition: bool, message: String) -> void:
	if not condition:
		_failures += 1
		push_error(message)
