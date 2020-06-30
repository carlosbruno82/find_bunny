extends Node2D

var tempo = 0
var score = 0
onready var pontos = $label
onready var pre_coelho = preload("res://Scenes/coelho.tscn")

func _ready():
	pass

func _process(delta):
	pontos.text = "Pontos: " + str(score)
	tempo += delta
	if tempo > rand_range(0.5, 2.5):
		emitir_coelho()
		tempo = 0

func emitir_coelho():
	var coelho = pre_coelho.instance()
	coelho.position = Vector2(rand_range(40, 540), 877)
	coelho.vel = rand_range(3, 6)
	coelho.pos_final = rand_range(500, 820)
	self.add_child(coelho)
