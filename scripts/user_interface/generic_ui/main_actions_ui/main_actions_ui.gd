class_name MainActionsUI
extends GenericUI

@onready var cadastrar_pensamento_button: Button = $VBoxContainer/CadastrarPensamentoButton
@onready var listar_pensamento_button: Button = $VBoxContainer/ListarPensamentoButton

func _on_cadastrar_pensamento_button_pressed() -> void:
	ui_changed.emit("cadastro_pensamento_ui")

func _on_listar_pensamento_button_pressed() -> void:
	ui_changed.emit("lista_pensamento_ui")
