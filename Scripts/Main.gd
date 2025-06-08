extends Node2D

@onready var MARKERS : Dictionary[String, Marker2D] = {
	'A1': $Board/A1,
	'A2': $Board/A2,
	'A3': $Board/A3,
	'A4': $Board/A4,
	'A5': $Board/A5,
	
	'B1': $Board/B1,
	'B2': $Board/B2,
	'B3': $Board/B3,
	'B4': $Board/B4,
	'B5': $Board/B5,
	
	'C1': $Board/C1,
	'C2': $Board/C2,
	'C3': $Board/C3,
	'C4': $Board/C4,
	'C5': $Board/C5,
	
	'D1': $Board/D1,
	'D2': $Board/D2,
	'D3': $Board/D3,
	'D4': $Board/D4,
	'D5': $Board/D5,
	
	'E1': $Board/E1,
	'E2': $Board/E2,
	'E3': $Board/E3,
	'E4': $Board/E4,
	'E5': $Board/E5,
	
	'F1': $Board/F1,
	'F2': $Board/F2,
	'F3': $Board/F3,
	
	'G1': $Board/G1,
	'G2': $Board/G2,
	'G3': $Board/G3,
}

const LARGURA_CELULA = 4 #?

# Scenes
const CACHORRO = preload("res://Scenes/Cachorro.tscn")
const ONCA = preload("res://Scenes/Onca.tscn")

# Nodes
@onready var board_node = $Board
@onready var possibilidadesNode = $possibilidades
@onready var turnoNode = $turno

# Vars
var tabuleiro:Tabuleiro
var turno:bool
var estado:bool
var movimentacoes:Array
var peca_selecionada:Vector2

# vazio = null; onca = 0; cachorro > 0

# Called when the node enters the scene tree for the first time.
func _ready():
	tabuleiro = Tabuleiro.new(MARKERS)
	preparar_tabuleiro()
	mostrar_tabuleiro()

func preparar_tabuleiro() -> void:
	var pecas : Array = [
		Peca.new('CACHORRO_01','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_02','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_03','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_04','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_05','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_06','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_07','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_08','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_09','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_10','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_11','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_12','CACHORRO',CACHORRO),
		Peca.new('ONCA_01','ONÇA',ONCA),
		Peca.new('CACHORRO_13','CACHORRO',CACHORRO),
		Peca.new('CACHORRO_14','CACHORRO',CACHORRO),
	]

	# funciona pois há mais espaços que peças
	for espaco in tabuleiro.get('espacos'):
		if pecas.size() == 0:
			break
		if espaco.get('id') == 'C3':
			for key in range(pecas.size()):
				if pecas[key].get('tipo') == 'ONÇA':
					espaco.peca = pecas[key]
					espaco.peca.posicao = espaco.posicao
					pecas.remove_at(key)
					break
		elif pecas.size() > 0:
			espaco.peca = pecas[0]
			espaco.peca.posicao = espaco.posicao
			pecas.remove_at(0)

func mostrar_tabuleiro():
	for espaco in tabuleiro.get('espacos'):
		if espaco.peca != null:
			var peca = espaco.peca.scene.instantiate()
			peca.global_position = espaco.posicao
			board_node.add_child(peca)
			
			peca.call_deferred("initialize")

func jogar():
	pass
