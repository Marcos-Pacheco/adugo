extends Node2D
class_name ComportamentoOnca

var sprite_frames: SpriteFrames
var anim_sprite: AnimatedSprite2D
var tipo_peca: String # cachorro ou onca
var selected: int = 0; # status seleçao

# classe nao eh executada pela ordem padrao do godot(por meio de _ready), mas sim em um momento
# especifico do script main
func initialize(tipo_peca:String):
	self.anim_sprite = $AnimatedSprite2D
	self.tipo_peca = tipo_peca
	if not self.anim_sprite:
		push_error("AnimatedSprite2D not found in ", name)
		return
	else:
		play_idle()

func play_idle():
	var ani = 'idle_' + self.tipo_peca
	if self.anim_sprite.sprite_frames.has_animation(ani):
		self.anim_sprite.play(ani)

func play_hover():
	var ani = 'hover_' + self.tipo_peca
	if self.anim_sprite.sprite_frames.has_animation(ani):
		self.anim_sprite.play(ani)

func play_selected():
	var ani = 'selected_' + self.tipo_peca
	if self.anim_sprite.sprite_frames.has_animation(ani):
		self.anim_sprite.play(ani)

func _on_mouse_entered():
	if self.selected == 1:
		play_selected()
	else:
		play_hover()

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if self.selected == 0:
			play_selected()
			self.selected = 1
		else:
			play_hover()
			self.selected = 0

func _on_mouse_exited():
	if self.selected == 1:
		play_selected()
	else:
		play_idle()
