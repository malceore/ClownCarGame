extends Node2D

func _physics_process(delta):
	$Skeleton/hip.rotation_degrees = $physics_hip.rotation_degrees
	$Skeleton/hip/torso.rotation_degrees = $physics_torso.rotation_degrees
	$Skeleton/hip/torso/head.rotation_degrees = $physics_neck.rotation_degrees
	$Skeleton/hip/torso/arm_left.rotation_degrees = $physics_left_arm.rotation_degrees
	$Skeleton/hip/torso/arm_left/hand_left.rotation_degrees = $physics_left_hand.rotation_degrees
	$Skeleton/hip/torso/arm_right.rotation_degrees = $physics_right_arm.rotation_degrees
	$Skeleton/hip/torso/arm_right/hand_right.rotation_degrees = $physics_right_hand.rotation_degrees
	$Skeleton/hip/leg_left.rotation_degrees = $physics_left_leg.rotation_degrees
	$Skeleton/hip/leg_left/calf_left.rotation_degrees = $physics_left_shin.rotation_degrees
	$Skeleton/hip/leg_right.rotation_degrees = $physics_right_leg.rotation_degrees
	$Skeleton/hip/leg_right/calf_right.rotation_degrees = $physics_right_shin.rotation_degrees
