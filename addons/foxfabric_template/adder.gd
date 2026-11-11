@icon("uid://dbsqetta8uy1d")
class_name Adder
extends Node
## A node that adds numbers together.
##
## A template showing how scripts in FoxFabric should be written.

## Emitted when [method add] produces a result.
signal added(result: float)

## The value added to every result.
@export var offset := 0.0

## If [code]true[/code], results are rounded to the nearest whole number.
@export var rounded := false


## Returns the sum of [param x], [param y], and [member offset].
func add(x: float, y: float) -> float:
	var result := x + y + offset
	if rounded:
		result = roundf(result)
	added.emit(result)
	return result
