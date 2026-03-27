extends RigidBody3D

@onready var engine = $Engine

func _physics_process(delta: float) -> void:
	if engine.throttle > 0.0:
		self.apply_central_force(Vector3.FORWARD * engine.torqe)
