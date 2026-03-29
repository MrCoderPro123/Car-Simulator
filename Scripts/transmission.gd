extends Node3D

var engine_torqe := 0
var clutch := 1.0
var output_power = 0.0

func _process(delta: float) -> void:
	if Input.is_action_pressed("clutch_increase"):
		if clutch > 0.1:
			clutch -= 0.1
	if Input.is_action_pressed("clutch_decrease"):
		if clutch < 1.0:
			clutch += 0.1
	
	output_power = engine_torqe * clutch
