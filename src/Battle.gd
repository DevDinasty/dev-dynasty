extends Control

signal textbox_closed

export(Resource) var enemy = null

var questions = [
	{
		"pergunta": "Quanto é 1+1?  a) 2  b) 1  c) 3",
		"resposta": 1
	},    
	{
		"pergunta": "Quanto é 1+2?  a) 2  b) 1  c) 3",
		"resposta": 3
	},
	{
		"pergunta": "Quanto é 1+0?  a) 2  b) 1  c) 3",
		"resposta": 2
	},
	{
		"pergunta": "Quanto é 25-10?  a) 10  b) 15  c) 5",
		"resposta": 2
	},
	{
		"pergunta": "Quanto é 12-4?  a) 8  b) 9  c) 10",
		"resposta": 1
	},
	{
		"pergunta": "Quanto é 12x2?  a) 12  b) 32  c) 24",
		"resposta": 3
	},
	{
		"pergunta": "Quanto é 11x5?  a) 45  b) 55  c) 56",
		"resposta": 2
	},
	{
		"pergunta": "Quanto é 10/2?  a)0,5  b) 5  c) 2",
		"resposta": 2
	},
	{
		"pergunta": "Quanto é 25/8?  a)3  b) 3,128  c) 3,125",
		"resposta": 3
	},
]

var current_player_health = 0
var current_enemy_health = 0
var is_defending = false
var current_health = 35
var max_health = 35
var damage = 1

var random_value = null

func _ready():
	set_health($EnemyContainer/ProgressBar, enemy.health, enemy.health)
	set_health($PlayerPanel/PlayerData/ProgressBar, current_health, max_health)
	$EnemyContainer/Enemy.texture = enemy.texture
	
	current_player_health = current_health
	current_enemy_health = enemy.health
	
	$Textbox.hide()
	$ActionsPanel.hide()
	$ActionsPanel2.hide()
	
	display_text("A wild %s appears!" % enemy.name.to_upper())
	yield(self, "textbox_closed")
	$ActionsPanel.show()

func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP: %d/%d" % [health, max_health]

func _input(event):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(BUTTON_LEFT)) and $Textbox.visible:
		$Textbox.hide()
		emit_signal("textbox_closed")

func display_text(text):
	$ActionsPanel.hide()
	$Textbox.show()
	$Textbox/Label.text = text

func enemy_turn():
	display_text("%s launches at you fiercely!" % enemy.name)
	yield(self, "textbox_closed")
	
	$ActionsPanel2.hide()
	
	if is_defending:
		is_defending = false
		$AnimationPlayer.play("mini_shake")
		yield($AnimationPlayer, "animation_finished")
		display_text("You defended successfully!")
		yield(self, "textbox_closed")
	else:
		current_player_health = max(0, current_player_health - enemy.damage)
		set_health($PlayerPanel/PlayerData/ProgressBar, current_player_health, max_health)
		$AnimationPlayer.play("shake")
		yield($AnimationPlayer, "animation_finished")
		display_text("%s dealt %d damage!" % [enemy.name, enemy.damage])
		yield(self, "textbox_closed")
	$ActionsPanel.show()
	
	if current_player_health <= 0:
		display_text("Your life is in danger , u run away safely!")
		yield(self, "textbox_closed")
		yield(get_tree().create_timer(0.25), "timeout")
		get_tree().change_scene("res://menu/Menu.tscn")
	

func _on_Run_pressed():
	display_text("Got away safely!")
	yield(self, "textbox_closed")
	yield(get_tree().create_timer(0.25), "timeout")
	get_tree().change_scene("res://mundo2d/mundoe2D.tscn")


func _on_Attack_pressed():
	
	random_value = int(rand_range(1,9))
	
	damage = int(rand_range(10,30))
	
	var pergunta = questions[random_value].pergunta
	
	display_text(pergunta)
	yield(self, "textbox_closed")
	
	$ActionsPanel2.show()

func _on_1_pressed():
	
	var resposta = questions[random_value].resposta
	
	if resposta == 1:
		display_text("You swing your piercing sword!")
		yield(self, "textbox_closed")
		
		current_enemy_health = max(0, current_enemy_health - damage)
		set_health($EnemyContainer/ProgressBar, current_enemy_health, enemy.health)
		
		$AnimationPlayer.play("enemy_damaged")
		yield($AnimationPlayer, "animation_finished")
		
		display_text("You dealt %d damage!" % damage)
		yield(self, "textbox_closed")
		
		if current_enemy_health == 0:
			display_text("%s was defeated!" % enemy.name)
			yield(self, "textbox_closed")
			
			$AnimationPlayer.play("enemy_died")
			yield($AnimationPlayer, "animation_finished")
			
			yield(get_tree().create_timer(0.25), "timeout")
			get_tree().change_scene("res://mundo2d/mundoe2D.tscn")
		
		enemy_turn()
	else:
		display_text("Errooo!")
		yield(self, "textbox_closed")
		enemy_turn()
	


func _on_2_pressed():
	
	var resposta = questions[random_value].resposta
	
	if resposta == 2:
		display_text("You swing your piercing sword!")
		yield(self, "textbox_closed")
		
		current_enemy_health = max(0, current_enemy_health - damage)
		set_health($EnemyContainer/ProgressBar, current_enemy_health, enemy.health)
		
		$AnimationPlayer.play("enemy_damaged")
		yield($AnimationPlayer, "animation_finished")
		
		display_text("You dealt %d damage!" % damage)
		yield(self, "textbox_closed")
		
		if current_enemy_health == 0:
			display_text("%s was defeated!" % enemy.name)
			yield(self, "textbox_closed")
			
			$AnimationPlayer.play("enemy_died")
			yield($AnimationPlayer, "animation_finished")
			
			yield(get_tree().create_timer(0.25), "timeout")
			get_tree().change_scene("res://mundo2d/mundoe2D.tscn")
		
		enemy_turn()
	else:
		display_text("Errooo!")
		yield(self, "textbox_closed")
		enemy_turn()
	

func _on_3_pressed():
	
	var resposta = questions[random_value].resposta
	
	if resposta == 3:
		display_text("You swing your piercing sword!")
		yield(self, "textbox_closed")
		
		current_enemy_health = max(0, current_enemy_health - damage)
		set_health($EnemyContainer/ProgressBar, current_enemy_health, enemy.health)
		
		$AnimationPlayer.play("enemy_damaged")
		yield($AnimationPlayer, "animation_finished")
		
		display_text("You dealt %d damage!" % damage)
		yield(self, "textbox_closed")
		
		if current_enemy_health == 0:
			display_text("%s was defeated!" % enemy.name)
			yield(self, "textbox_closed")
			
			$AnimationPlayer.play("enemy_died")
			yield($AnimationPlayer, "animation_finished")
			
			yield(get_tree().create_timer(0.25), "timeout")
			get_tree().change_scene("res://mundo2d/mundoe2D.tscn")
		
		enemy_turn()
	else:
		display_text("Errooo!")
		yield(self, "textbox_closed")
		enemy_turn()
	

func _on_Defend_pressed():
	is_defending = true
	
	display_text("You prepare defensively!")
	yield(self, "textbox_closed")
	
	yield(get_tree().create_timer(0.25), "timeout")
	
	enemy_turn()
