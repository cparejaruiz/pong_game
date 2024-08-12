extends Node2D

const CENTER = Vector2(640, 360)
var player_score = 0
var computer_score = 0

func _on_goal_left_body_entered(body):
	computer_score += 1
	$ComputerScore.text = str(computer_score)
	final()
	
func _on_goal_right_body_entered(body):
	player_score += 1
	$PlayerScore.text = str(player_score)
	final()
	
func reset():
	await get_tree().create_timer(1.0).timeout
	$Ball.position = Vector2(CENTER)
	$Ball.call("set_ball_velocity")
	$Player.position.y = CENTER.y
	$Computer.position.y = CENTER.y
	
	
func text_info():
	if (player_score < computer_score):
		$TextInfo.text = "Vas perdiendo, loser"
		reset()
		
	elif (player_score == computer_score):
		$TextInfo.text = "Mmmm, sigamos"
		reset()			
	else:
		$TextInfo.text = "Te creia peor"
		reset()		
		
func final():
	if (player_score == 10):
		$TextInfo.text = "Has ganado, pero no te flipes"
	elif (computer_score == 10):
		$TextInfo.text = "Has perdido: deshonra sobre tu familia"
	else:
		text_info()	
		
