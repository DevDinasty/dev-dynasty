extends Button



func _on_Start_mouse_entered():
	$Sprite.modulate.r = 0.7
	$Sprite.modulate.g = 0.7
	$Sprite.modulate.b = 0.7
	
	pass # Replace with function body.


func _on_Start_mouse_exited():
	$Sprite.modulate.r = 1
	$Sprite.modulate.g = 1
	$Sprite.modulate.b = 1
	
	pass # Replace with function body.


func _on_Start_pressed():
	$Sprite.modulate.r = 0.5
	$Sprite.modulate.g = 0.5
	$Sprite.modulate.b = 0.5
	get_tree().quit()
	
	pass # Replace with function body.
