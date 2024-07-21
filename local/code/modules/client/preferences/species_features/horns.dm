/datum/preference/choiced/lizard_horns
	relevant_external_organ = /obj/item/organ/external/horns

/datum/preference/choiced/lizard_horns/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "dna_horns_color"

	return data
