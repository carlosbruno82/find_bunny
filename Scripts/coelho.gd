extends Sprite

var pos_inicial
var subir = true
export var vel = 1
export var pos_final = 500

onready var pre_cacos = preload("res://Scenes/cacos.tscn")

func _ready():
	pos_inicial = self.position.y # 877

func _process(delta):
	if position.y < pos_inicial - pos_final: #877 - 500 = 377
		subir = false
	elif position.y == pos_inicial:
		subir = true
	
	if subir:
		position.y -= vel * 5
	else:
		position.y += vel
		

func _on_button_button_down():
	$"../audio".play()
	cacos()
	$"../".score += 1 # ou get_parent().score += 1
	queue_free()

func cacos():
	var cacos = pre_cacos.instance()
	cacos.position = self.position
	get_parent().add_child(cacos)
