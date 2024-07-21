/datum/preference/choiced/lizard_frills
	relevant_mutant_bodypart = "frills"

/datum/preference/choiced/lizard_frills/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "dna_frill_color"

	return data
