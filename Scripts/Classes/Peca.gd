class_name Peca

var id: String
var posicao: Vector2  # Posição visual
var tipo: String  # IDs de espaços conectados
var scene: Object # scene objeto preload
var scale: Vector2 # proporção do sprite

func _init(id: String, tipo: String, scene: Object, posicao: Vector2 = Vector2(0,0), scale = Vector2(0.1,0.1)) -> void:
	self.id = id
	self.tipo = tipo
	self.scene = scene
	self.posicao = posicao
	self.scale = scale
