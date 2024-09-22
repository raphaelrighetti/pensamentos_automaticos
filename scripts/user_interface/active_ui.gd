class_name ActiveUI
extends Control

const UI_SCENES = {
	"main_actions_ui": "res://scenes/user_interface/generic_ui/main_actions_ui/main_actions_ui.tscn",
	"cadastro_pensamento_ui": "res://scenes/user_interface/generic_ui/cadastro_pensamento_ui/cadastro_pensamento_ui.tscn"
}

func change_ui(ui_name: String) -> void:
	if ui_name not in UI_SCENES:
		return
	
	print(ui_name)
	print(UI_SCENES[ui_name])
	
	var packed_scene: PackedScene = load(UI_SCENES[ui_name])
	var instance := packed_scene.instantiate() as GenericUI
	
	for child in get_children():
		if child is GenericUI:
			if child.ui_changed.is_connected(change_ui):
				child.ui_changed.disconnect(change_ui)
			child.queue_free()
	
	instance.ui_changed.connect(change_ui)
	add_child(instance)
	
