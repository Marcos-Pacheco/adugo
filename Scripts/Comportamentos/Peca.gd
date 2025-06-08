class_name ComportamentoPeca
extends Node2D

# Exported variables to customize in inherited scenes
@export var idle_animation_name: String = "idle"
@export var hover_animation_name: String = "hover"
@export var selected_animation_name: String = "selected"
@export var sprite_frames: SpriteFrames

@onready var anim_sprite: AnimatedSprite2D

func initialize():
	anim_sprite = AnimatedSprite2D.new()
	anim_sprite.sprite_frames = sprite_frames
	#print(anim_sprite,' - ',sprite_frames)
	play_idle()
	self.add_child(anim_sprite)

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
	play_hover()

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		play_selected()

func _on_mouse_exited():
	play_idle()
