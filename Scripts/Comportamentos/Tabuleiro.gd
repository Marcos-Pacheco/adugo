extends Node2D
class_name ComportamentoTabuleiro

var markers: Dictionary[String,Marker2D]
var espacos: Array [EspacoTabuleiro]
var tabuleiro: Tabuleiro
signal is_selected(espaco: EspacoTabuleiro)

func _ready():
	for node in get_children():
		if node is Marker2D:
			self.markers[node.name] = node
	
	for marker in self.markers.values():
		# conecta o sinal da nova cena instaciada ao _on_peca_selecionada
		var area2d = marker.get_node('Area2D')
		area2d.input_event.connect(_on_espaco_selecionado.bind(area2d))
	
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

	self.tabuleiro = Tabuleiro.new(espacos)

func _on_espaco_selecionado(_viewport, event, _shape_idx,area2d: Area2D):
	if event is InputEventMouseButton and event.pressed:
		emit_signal('is_selected',self._find_espaco(area2d.get_parent().name))

func _find_espaco(id:String) -> EspacoTabuleiro:
	for espaco in self.espacos:
		if espaco.id == id:
			return espaco
	return null
