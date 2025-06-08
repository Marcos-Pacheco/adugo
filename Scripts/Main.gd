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
const PECA_SCENE = preload("res://Scenes/Peca.tscn")

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
		Peca.new('cachorro_01','cachorro',PECA_SCENE),
		Peca.new('cachorro_02','cachorro',PECA_SCENE),
		Peca.new('cachorro_03','cachorro',PECA_SCENE),
		Peca.new('cachorro_04','cachorro',PECA_SCENE),
		Peca.new('cachorro_05','cachorro',PECA_SCENE),
		Peca.new('cachorro_06','cachorro',PECA_SCENE),
		Peca.new('cachorro_07','cachorro',PECA_SCENE),
		Peca.new('cachorro_08','cachorro',PECA_SCENE),
		Peca.new('cachorro_09','cachorro',PECA_SCENE),
		Peca.new('cachorro_10','cachorro',PECA_SCENE),
		Peca.new('cachorro_11','cachorro',PECA_SCENE),
		Peca.new('cachorro_12','cachorro',PECA_SCENE),
		Peca.new('onca_01','onca',PECA_SCENE),
		Peca.new('cachorro_13','cachorro',PECA_SCENE),
		Peca.new('cachorro_14','cachorro',PECA_SCENE),
	]

	# funciona pois há mais espaços que peças
	for espaco in tabuleiro.get('espacos'):
		if pecas.size() == 0:
			break
		if espaco.get('id') == 'C3':
			for key in range(pecas.size()):
				if pecas[key].get('tipo') == 'onca':
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
			
			# inicia as animaçoes de peça
			peca.initialize(espaco.peca.tipo)

func jogar():
	pass
