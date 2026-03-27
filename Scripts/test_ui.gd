extends Control

@export var car : Node
@onready var torqe: Label = $Torqe
@onready var rpm: Label = $RPM

func _process(delta: float) -> void:
	if car and car.engine:
		torqe.text = "".join(["Torqe: ", car.engine.torqe])
		rpm.text = "".join(["RPM: ", car.engine.rpm])
