class_name Tabuleiro

var espacos: Array [EspacoTabuleiro]

func _init(espacos: Array[EspacoTabuleiro]) -> void:
	self.espacos = espacos

#func _movimeto_valido(origem_id: String, destino_id: String) -> bool:
	#var espaco_origem = _buscar_espaco(origem_id)
	#var espaco_destino = _buscar_espaco(destino_id)
	#
	#if not espaco_origem or not espaco_destino:
		#return false
	#if not destino_id in espaco_origem.adjacentes:
		#return false
	#if espaco_destino.peca != null:
		#return false
		#
	#if espaco_origem.peca and espaco_origem.peca.tipo == 'Onça':
		#return _validar_movimento_onca(origem_id,destino_id)
		#
	#return true
#
#func _validar_movimento_onca(origem_id: String, destino_id: String) -> bool:
	#return _get_caminho(origem_id, destino_id).size() > 0
#
#func _get_caminho(origem_id: String, destino_id: String) -> Array:
	#var fila = [[origem_id]]
	#var visitados = {origem_id: true}
	#
	#while fila:
		#var caminho_atual = fila.pop_front()
		#var no_atual = caminho_atual[-1]
		#
		#if no_atual == destino_id:
			#return caminho_atual
		#
		#for vizinho in espacos[no_atual].adjacentes:
			#if not visitados.get(vizinho):
				#if espacos[vizinho].peca == null || _pode_pular(no_atual, vizinho):
					#var novo_caminho = caminho_atual.duplicate()
					#novo_caminho.append(vizinho)
					#fila.append(novo_caminho)
					#visitados[vizinho] = true
	#
	#return []
#
#func _pode_pular(a,b):
	#pass
#
#func _buscar_espaco(id: String):
	#for espaco in espacos:
		#if espaco.get('id') == id:
			#return espaco
	#return false

#func mover_peca() -> bool:
#	if not _movimento_valido(origem_id,destino_id):
#		return false
