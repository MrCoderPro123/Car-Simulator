class_name CarEngine
extends Node3D

@export var idle_rpm := 1000
@export var stall_rpm := 800
@export var idle_decay := 5.0
@export var max_rpm := 9000
@export var accelaration_speed := 3
@export var deccelaration_speed := 1
@export var horsepower := 20
@export var max_torqe := 80

var throttle := 0.0
var rpm := 1000
var target_rpm := 0
var actual_smoothing_speed := 0
var torqe := 0
var is_engine_on := true

func _process(delta: float) -> void:
	if is_engine_on:
		if Input.is_action_pressed("throttle_up"):
			throttle += 0.1
			actual_smoothing_speed = accelaration_speed
		else:
			throttle -= 0.1
			actual_smoothing_speed = deccelaration_speed
	
		if throttle < 0:
			throttle = 0
		if throttle > 1:
			throttle = 1
	
		target_rpm = idle_rpm + (max_rpm - idle_rpm) * throttle
	
	
		rpm = lerp(rpm, target_rpm, actual_smoothing_speed * delta)
	#rpm = clamp(rpm, idle_rpm, max_rpm)
	
		var calc_torqe = (horsepower * 5252) / rpm
		torqe = calc_torqe
		if torqe > max_torqe:
			torqe = max_torqe
		
		if throttle == 0 and rpm <= idle_rpm:
			rpm -= 5
	
	if rpm <= stall_rpm:
		is_engine_on = false
		rpm = lerp(rpm, 0, 5 * delta)
		torqe = lerp(torqe, 0, 5 * delta)
	
	#print(torqe)
	
