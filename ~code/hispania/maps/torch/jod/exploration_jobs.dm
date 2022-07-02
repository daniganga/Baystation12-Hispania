/datum/job/pathfinder
	title = "Explorador Supervisor"
	title_english = "Pathfinder"
	department = "Exploracion"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "El Jefe de Ciencias Oficial"
	selection_color = "#68099e"
	minimal_player_age = 1
	economic_power = 10
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)
	allowed_ranks = list(
		/datum/mil_rank/ec/o1
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)
	skill_points = 22

	access = list(
		access_pathfinder, access_explorer, access_eva, access_maint_tunnels, access_bridge, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_expedition_shuttle_helm,
		access_guppy, access_hangar, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_maint, access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch, access_torch_fax, access_radio_comm, access_radio_exp, access_radio_sci
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder/get_description_blurb()
	return "Eres el Explorador supervisor. Su deber es organizar y llevar las expediciones a sitios fuera de la nave, llevando a cabo la mision principal de la CE. Ordene a los exploradores. Asegurese de que la expedicion tenga los suministros y el personal que necesita. Puede pilotar a Charon si nadie mas puede. Una vez en la mision, su deber es asegurarse de que cualquier cosa de interes cientifico sea devuelto a la nave y pase al laboratorio de investigacion."

/datum/job/nt_pilot
	title = "Piloto de Exploracion"
	title_english = "Shuttle Pilot"
	supervisors = "Explorador Supervisor"
	department = "Exploracion"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#68099e"
	economic_power = 8
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 24)
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/pilot
	allowed_branches = list(
		/datum/mil_branch/civilian,
		/datum/mil_branch/expeditionary_corps = /decl/hierarchy/outfit/job/torch/crew/exploration/pilot,
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/exploration/pilot/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor = /decl/hierarchy/outfit/job/torch/passenger/research/nt_pilot,
		/datum/mil_rank/ec/e7,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7
	)

	access = list(
		access_mining_office, access_petrov, access_petrov_helm, access_petrov_maint, access_mining_station,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm,
		access_mining, access_pilot, access_solgov_crew, access_eva, access_explorer, access_research,
		access_radio_exp, access_radio_sci, access_radio_sup, access_maint_tunnels, access_emergency_storage
	)
	min_skill = list(	SKILL_EVA   = SKILL_BASIC,
						SKILL_PILOT = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

/datum/job/nt_pilot/get_description_blurb()
	return "El trabajo del piloto del transbordador consiste en gran medida en esperar a que el Explorador supervisor llame para una mision fuera. Una vez que se reune todo el personal apropiado y se preparan todos los suministros, el piloto ingresa a la cabina y usa las consolas para volar el transbordador al espacio y luego a la superficie del sitio de la mision que se haya seleccionado para el dia. Una vez que esto se completa, esperan en la nave, haciendo todo lo posible para mantenerse entretenido, hasta que llega el momento de volar de regreso. Entre estas misiones, es libres de vagar por el barco y relajarse."

/datum/job/explorer
	title = "Explorador"
	title_english = "Explorer"
	department = "Exploracion"
	department_flag = EXP
	total_positions = 5
	spawn_positions = 5
	supervisors = "El Comandante Oficial, El Ejecutivo Oficial y El Explorador Supervisor"
	selection_color = "#68099e"
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 20
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/explorer
	allowed_branches = list(/datum/mil_branch/expeditionary_corps)

	allowed_ranks = list(
		/datum/mil_rank/ec/e3,
		/datum/mil_rank/ec/e5
	)
	min_skill = list(   SKILL_EVA = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)

	access = list(
		access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_petrov, access_petrov_maint, access_research, access_radio_exp
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "Eres un explorador. Su deber es ir a expediciones a sitios fuera de lugar. El Explorador supervisor es el lider de su equipo. Debes buscar cualquier cosa de interes economico o cientifico para el SCG: depositos minerales, flora/fauna alienigena, artefactos. Tambien es probable que encuentre entornos peligrosos, vida silvestre agresiva o sistemas de defensa de mal funcionamiento, asique pise con cuidado."
