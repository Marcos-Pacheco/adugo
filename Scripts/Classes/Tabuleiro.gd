class_name Tabuleiro

var espacos: Array = []

func _init(markers: Dictionary[String,Marker2D]) -> void:
	_criar_tabuleiro(markers)

func _criar_tabuleiro(markers: Dictionary[String,Marker2D]) -> void:
	espacos.append(EspacoTabuleiro.new('A1',['A2','B1','B2'],markers['A1'].position))
	espacos.append(EspacoTabuleiro.new('A2',['A1','A3','B2'],markers['A2'].position))
	espacos.append(EspacoTabuleiro.new('A3',['A2','A4','B2','B3','B4'],markers['A3'].position))
	espacos.append(EspacoTabuleiro.new('A4',['A3','A5','B4'],markers['A4'].position))
	espacos.append(EspacoTabuleiro.new('A5',['A4','B4','B5'],markers['A5'].position))
	
	espacos.append(EspacoTabuleiro.new('B1',['A1','B2','C1'],markers['B1'].position))
	espacos.append(EspacoTabuleiro.new('B2',['A1','A2','A3','B1','B3','C1','C2','C3'],markers['B2'].position))
	espacos.append(EspacoTabuleiro.new('B3',['B2','A3','B4','C3'],markers['B3'].position))
	espacos.append(EspacoTabuleiro.new('B4',['A3','A4','A5','B3','B5','C3','C4','C5'],markers['B4'].position))
	espacos.append(EspacoTabuleiro.new('B5',['A5','B4','C5'],markers['B5'].position))
	
	espacos.append(EspacoTabuleiro.new('C1',['B1','C2','D1'],markers['C1'].position))
	espacos.append(EspacoTabuleiro.new('C2',['C1','B2','C3','D2'],markers['C2'].position))
	espacos.append(EspacoTabuleiro.new('C3',['C2','B2','B3','B4','C4','D4','D3','D2'],markers['C3'].position))
	espacos.append(EspacoTabuleiro.new('C4',['C3','B4','C5','D4'],markers['C4'].position))
	espacos.append(EspacoTabuleiro.new('C5',['C4','B4','B5','D5','D4'],markers['C5'].position))
	
	espacos.append(EspacoTabuleiro.new('D1',['C1','D2','E1'],markers['D1'].position))
	espacos.append(EspacoTabuleiro.new('D2',['D1','C1','C2','C3','D3','E1','E2','E3'],markers['D2'].position))
	espacos.append(EspacoTabuleiro.new('D3',['D2','C3','D4','E3'],markers['D3'].position))
	espacos.append(EspacoTabuleiro.new('D4',['D3','C3','C4','C5','D5','E5','E4','E3'],markers['D4'].position))
	espacos.append(EspacoTabuleiro.new('D5',['D4','C5','E5'],markers['D5'].position))
	
	espacos.append(EspacoTabuleiro.new('E1',['D1','D2','E2'],markers['E1'].position))
	espacos.append(EspacoTabuleiro.new('E2',['E1','D2','E3'],markers['E2'].position))
	espacos.append(EspacoTabuleiro.new('E3',['E2','D2','D3','D4','E4','F1','F2','F3'],markers['E3'].position))
	espacos.append(EspacoTabuleiro.new('E4',['E3','D4','E5'],markers['E4'].position))
	espacos.append(EspacoTabuleiro.new('E5',['E4','D4','D5'],markers['E5'].position))
	
	espacos.append(EspacoTabuleiro.new('F1',['E3','F2','G1'],markers['F1'].position))
	espacos.append(EspacoTabuleiro.new('F2',['E2','D2','D3','D4','E4'],markers['F2'].position))
	espacos.append(EspacoTabuleiro.new('F3',['E3','D4','E5'],markers['F3'].position))
	
	espacos.append(EspacoTabuleiro.new('G1',['F1','G2'],markers['G1'].position))
	espacos.append(EspacoTabuleiro.new('G2',['G1','F2','G3'],markers['G2'].position))
	espacos.append(EspacoTabuleiro.new('G3',['G3','F3'],markers['G3'].position))

func _movimeto_valido(origem_id: String, destino_id: String) -> bool:
	var espaco_origem = _buscar_espaco(origem_id)
	var espaco_destino = _buscar_espaco(destino_id)
	
	if not espaco_origem or not espaco_destino:
		return false
	if not destino_id in espaco_origem.adjacentes:
		return false
	if espaco_destino.peca != null:
		return false
		
	if espaco_origem.peca and espaco_origem.peca.tipo == 'Onça':
		return _validar_movimento_onca(origem_id,destino_id)
		
	return true

func _validar_movimento_onca(origem_id: String, destino_id: String) -> bool:
	return _get_caminho(origem_id, destino_id).size() > 0

func _get_caminho(origem_id: String, destino_id: String) -> Array:
	var fila = [[origem_id]]
	var visitados = {origem_id: true}
	
	while fila:
		var caminho_atual = fila.pop_front()
		var no_atual = caminho_atual[-1]
		
		if no_atual == destino_id:
			return caminho_atual
		
		for vizinho in espacos[no_atual].adjacentes:
			if not visitados.get(vizinho):
				if espacos[vizinho].peca == null || _pode_pular(no_atual, vizinho):
					var novo_caminho = caminho_atual.duplicate()
					novo_caminho.append(vizinho)
					fila.append(novo_caminho)
					visitados[vizinho] = true
	
	return []

func _pode_pular(a,b):
	pass

func _buscar_espaco(id: String):
	for espaco in espacos:
		if espaco.get('id') == id:
			return espaco
	return false

#func mover_peca() -> bool:
#	if not _movimento_valido(origem_id,destino_id):
#		return false
