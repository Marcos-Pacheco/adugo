class_name EspacoTabuleiro

var id: String
var posicao: Vector2  # Posição visual
var adjacentes: Array  # IDs de espaços conectados
var peca: Object = null  # Referência para a peça que está no esṕpoço

func _init(id: String, adjacentes: Array, posicao: Vector2) -> void:
	self.id = id
	self.adjacentes = adjacentes
	self.posicao = posicao
