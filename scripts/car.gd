extends Node3D

@onready var ball = $RigidBody3D
@onready var car_mesh = $Mesh
@onready var ground_ray = $Mesh/RayCast3D

@export var turn_speed = 5
@export var acceleration = 70
@export var honkRange = 6
var sphere_offset = Vector3(0, -1.0, 0)
var steering = 21.0
var turn_stop_limit = 0.75
var speed_input = 0
var rotate_input = 0
@export var camera_lerp = 3.0

var miniGaming = false

func _ready():
	ground_ray.add_exception(ball)

func _physics_process(delta):
	# Keep the car mesh aligned with the sphere
	car_mesh.transform.origin = ball.transform.origin + sphere_offset
	# Accelerate based on car's forward direction
	ball.apply_central_force(-car_mesh.global_transform.basis.z * speed_input)
	
func _input(event):
	if event.is_action_pressed("honk") and !miniGaming:
		$audioHonk.play()
		for clown in get_parent().clowns:
			if clown.position.distance_to(car_mesh.position) <= honkRange and clown.enabled:
				miniGaming = true
				var miniGame = owner.get_node("MiniGameLayer/MiniGame")
				miniGame.newClown()
				miniGame.show()
				await miniGame.visibility_changed
				if(!miniGame.cheated):
					clown.disable()
				miniGaming = false
				
	
func _process(delta):
	# Get accelerate/brake input
	speed_input = 0
	speed_input += Input.get_action_strength("accelerate")
	speed_input -= Input.get_action_strength("reverse")
	speed_input *= acceleration
	# Get steering input
	rotate_input = 0
	rotate_input += Input.get_action_strength("turn_left")
	rotate_input -= Input.get_action_strength("turn_right")
	rotate_input *= deg_to_rad(steering)
	# rotate car mesh
	if ball.linear_velocity.length() > turn_stop_limit:
		var new_basis = car_mesh.global_transform.basis.rotated(car_mesh.global_transform.basis.y, rotate_input)
		car_mesh.global_transform.basis = car_mesh.global_transform.basis.slerp(new_basis, turn_speed * delta)
		car_mesh.global_transform = car_mesh.global_transform.orthonormalized()
	handleArrow()
		
func handleArrow():
	var closestClown = get_parent().clowns[0]
	for clown in get_parent().clowns:
		if clown.position.distance_to(car_mesh.position) <= closestClown.position.distance_to(car_mesh.position) and clown.enabled:
			closestClown = clown
	$Mesh/Offset.look_at(closestClown.position)
	
			
