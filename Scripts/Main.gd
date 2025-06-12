extends Node2D

const LARGURA_CELULA = 4 #?

# Scenes
const PECA_SCENE = preload("res://Scenes/Peca.tscn")

# Nodes
@onready var tabuleiro = $Tabuleiro

# Vars
var turno:String # tipo da peça da vez; onca ou cachorros
var estado:bool
var movimentacoes:Array
var peca_selecionada: Peca
var espaco_selecionado: EspacoTabuleiro

# vazio = null; onca = 0; cachorro > 0

# Called when the node enters the scene tree for the first time.
func _ready():
	turno = 'onca'
	preparar_tabuleiro()
	mostrar_tabuleiro()
	jogar()

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
	for espaco in self.tabuleiro.get('espacos'):
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

func mostrar_tabuleiro() -> void:
	self.tabuleiro.is_selected.connect(_on_espaco_selecionado)
	for espaco in self.tabuleiro.get('espacos'):
		if espaco.peca != null:
			var peca = espaco.peca.scene.instantiate()
			peca.name = espaco.peca.id
			peca.global_position = espaco.posicao
			tabuleiro.add_child(peca)
			
			# conecta o sinal da nova cena instaciada ao _on_peca_selecionada
			peca.is_selected.connect(_on_peca_selecionada)
			
			# inicia as animaçoes de peça
			# nao confundir comportamento/peca com classes/peca
			peca.initialize(espaco.peca)
	pass

func _on_peca_selecionada(peca:Peca) -> void:
	self.peca_selecionada = peca
	print('Peca: ' + peca.id)
	self.jogar()

func _on_espaco_selecionado(espaco:EspacoTabuleiro) -> void:
	self.espaco_selecionado = espaco
	print('Espaço: ' + espaco.id)
	self.jogar()

func jogar() -> void:
	#print(self.peca_selecionada and self.espaco_selecionado)
	if self.peca_selecionada and self.espaco_selecionado:
		for node in tabuleiro.get_children():
			if self.peca_selecionada.id == node.name:
				var tween = create_tween()
				tween.tween_property(node,'position',self.espaco_selecionado.posicao,1)
			
		#print(tabuleiro.get_children())
		#self.peca_selecionada.scene.position = self.espaco_selecionado.posicao
	#if self.turno == self.peca_selecionada.tipo:
		#print('Peça correta')
		#if self.espaco_selecionado.
	#else:
		#print('Peça errada')
		
