extends RigidBody3D

@onready var engine = $Engine
@onready var transmission: Node3D = $Transmission

func _process(delta: float) -> void:
	transmission.engine_torqe = engine.torqe

func _physics_process(delta: float) -> void:
	if engine.throttle > 0.0:
		self.apply_central_force(Vector3.FORWARD * transmission.output_power)
