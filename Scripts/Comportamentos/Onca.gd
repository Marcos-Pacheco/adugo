extends Node2D
class_name ComportamentoOnca

var idle_animation_name: String = "idle"
var hover_animation_name: String = "hover"
var selected_animation_name: String = "selected"
var sprite_frames: SpriteFrames
var anim_sprite: AnimatedSprite2D
var selected: int = 0; # status seleçao

func initialize():
	# Find the AnimatedSprite2D node
	anim_sprite = $AnimatedSprite2D
	
	# Make sure we found it
	if not anim_sprite:
		push_error("AnimatedSprite2D not found in ", name)
		return
	else:
		play_idle()
# Common functionality
func play_idle():
	if anim_sprite.sprite_frames.has_animation(idle_animation_name):
		anim_sprite.play(idle_animation_name)

func play_hover():
	if anim_sprite.sprite_frames.has_animation(hover_animation_name):
		anim_sprite.play(hover_animation_name)

func play_selected():
	if anim_sprite.sprite_frames.has_animation(selected_animation_name):
		anim_sprite.play(selected_animation_name)

func _on_mouse_entered():
	if selected == 1:
		play_selected()
	else:
		play_hover()

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if selected == 0:
			play_selected()
			selected = 1
		else:
			play_hover()
			selected = 0

func _on_mouse_exited():
	if selected == 1:
		play_selected()
	else:
		play_idle()
