extends Area2D
static var stars_in_storage = 0
var star_is_collected = false
static var fun_win = 0


func _on_body_entered(body: Node2D) -> void:
	stars_in_storage = stars_in_storage + 1
	star_is_collected = true
	fun_win = fun_win + 1
	#if fun_win == 2:
		#print("You WINNN!")
	print(stars_in_storage)
	print(star_is_collected)
	queue_free()
