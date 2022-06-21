/datum/gear/gloves
	cost = 2
	slot = slot_gloves
	sort_category = "Guantes y ropa de mano"
	category = /datum/gear/gloves

/datum/gear/gloves/colored
	display_name = "Guantes, de colores"
	flags = GEAR_HAS_COLOR_SELECTION
	path = /obj/item/clothing/gloves/color

/datum/gear/gloves/latex
	display_name = "Guantes, latex"
	path = /obj/item/clothing/gloves/latex
	cost = 3
	flags = GEAR_HAS_NO_CUSTOMIZATION

/datum/gear/gloves/nitrile
	display_name = "Guantes, nitrile"
	path = /obj/item/clothing/gloves/latex/nitrile
	cost = 3
	flags = GEAR_HAS_NO_CUSTOMIZATION

/datum/gear/gloves/rainbow
	display_name = "guantes, arcoiris"
	path = /obj/item/clothing/gloves/rainbow

/datum/gear/gloves/evening
	display_name = "guantes, noche, seleccione color"
	path = /obj/item/clothing/gloves/color/evening
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/ring
	display_name = "anillo"
	path = /obj/item/clothing/ring
	cost = 2

/datum/gear/ring/New()
	..()
	var/ringtype = list()
	ringtype["CTI anillo"] = /obj/item/clothing/ring/cti
	ringtype["Anillo de la Universidad Mariner"] = /obj/item/clothing/ring/mariner
	ringtype["anillo de compromiso"] = /obj/item/clothing/ring/engagement
	ringtype["anillo de sello"] = /obj/item/clothing/ring/seal/signet
	ringtype["anillo masonico"] = /obj/item/clothing/ring/seal/mason
	ringtype["anillo, acero"] = /obj/item/clothing/ring/material/steel
	ringtype["anillo, plastiacero"] = /obj/item/clothing/ring/material/plasteel
	ringtype["anillo, bronce"] = /obj/item/clothing/ring/material/bronze
	ringtype["anillo, plata"] = /obj/item/clothing/ring/material/silver
	ringtype["anillo, oro"] = /obj/item/clothing/ring/material/gold
	ringtype["anillo, platino"] = /obj/item/clothing/ring/material/platinum
	ringtype["anillo, cristal"] = /obj/item/clothing/ring/material/glass
	ringtype["anillo, madera"] = /obj/item/clothing/ring/material/wood
	ringtype["anillo, plastico"] = /obj/item/clothing/ring/material/plastic
	gear_tweaks += new/datum/gear_tweak/path(ringtype)

/datum/gear/gloves/botany
	display_name = "guantes, botanica"
	path = /obj/item/clothing/gloves/thick/botany
	cost = 3
	allowed_roles = list(
		/datum/job/rd,
		/datum/job/scientist,
		/datum/job/chef,
		/datum/job/assistant
	)

/datum/gear/gloves/work
	display_name = "guantes, trabajo"
	path = /obj/item/clothing/gloves/thick
	cost = 3
