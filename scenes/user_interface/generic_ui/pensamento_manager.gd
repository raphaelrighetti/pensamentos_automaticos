class_name PensamentoManager
extends Node

const SAVES_DIR_PATH := "user://saves/"
const UUID_SIZE := 8

func _ready() -> void:
	if not DirAccess.dir_exists_absolute(SAVES_DIR_PATH):
		DirAccess.make_dir_absolute(SAVES_DIR_PATH)

func set_pensamento_situacao(pensamento: PensamentoAutomatico, value: String) -> void:
	pensamento.situacao = value

func set_pensamento_pensamento(pensamento: PensamentoAutomatico, value: String) -> void:
	pensamento.pensamento = value

func set_pensamento_quanto_acredita(pensamento: PensamentoAutomatico, value: int) -> void:
	pensamento.quanto_acredita = clampi(value, 0, 100)

func set_pensamento_emocao(pensamento: PensamentoAutomatico, value: String) -> void:
	pensamento.emocao = value

func set_pensamento_intensidade(pensamento: PensamentoAutomatico, value: int) -> void:
	pensamento.intensidade = clampi(value, 0, 100)

func save(pensamento: PensamentoAutomatico) -> void:
	if pensamento.uuid == null:
		pensamento.uuid = get_random_uuid()
	
	pensamento.data = Time.get_datetime_string_from_system()
	ResourceSaver.save(pensamento, get_save_path(pensamento))

func load() -> Array[PensamentoAutomatico]:
	return [PensamentoAutomatico.new()]

func exists(uuid: String) -> bool:
	var dir = DirAccess.open(SAVES_DIR_PATH)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		print(file_name)
		if file_name == uuid:
			return true
		else:
			return false
		file_name = dir.get_next()
	
	return false

func get_save_path(pensamento: PensamentoAutomatico) -> String:
	return SAVES_DIR_PATH + pensamento.uuid

func get_random_uuid() -> String:
	var uuid: String = ""
	
	for i in range(UUID_SIZE):
		uuid += str(randi_range(0, 9))
	
	return uuid
